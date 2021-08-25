require "shrine"

if !Rails.env.development? and !Rails.env.test?
  require "shrine/storage/s3"
  s3_options = {
    bucket: ENV["AWS_S3_BUCKET"],
    access_key_id: ENV["AWS_S3_ACCESS_ID_KEY"],
    secret_access_key: ENV["AWS_S3_ACCESS_SECRET_KEY"],
    region: ENV["AWS_S3_REGION"],
  }

if Rails.env.development? && ENV["AWS_S3_ENDPOINT"]
  s3_options[:endpoint] = ENV["AWS_S3_ENDPOINT"]
  s3_options[:force_path_style] = true
end

if Rails.env.production?
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(**s3_options),
  }
  Shrine.plugin :url_options, store: { host: ENV["AWS_CLOUDFRONT_URL"] }
else
  require "shrine/storage/file_system"
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
  }
  Shrine.plugin :url_options
end if

Shrine.plugin :activerecord
Shrine.plugin :instrumentation
Shrine.plugin :determine_mime_type, analyzer: :marcel, log_subscriber: nil
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :derivatives
Shrine.plugin :derivation_endpoint, secret_key: Rails.application.secret_key_base


Shrine.plugin :presign_endpoint, presign_options: lambda { |request|
  filename = request.params["filename"]
  type     = request.params["type"]

  {
    content_disposition: ContentDisposition.inline(filename),
    content_type: type,
    content_length_range: 0..(5.megabytes),
  }
}

Shrine.plugin :backgrounding
Shrine::Attacher.promote_block { Attachment::PromoteJob.perform_later(record, name, file_data) }
Shrine::Attacher.destroy_block { Attachment::DestroyJob.perform_later(data) }
