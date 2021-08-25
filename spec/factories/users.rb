FactoryGirl.define do
  factory :user do
    username { FFaker::Lorem.phrase }
    email { FFaker::Internet.email }
    encrypted_password { FFaker::Lorem.phrase }
    sign_in_count { rand(99) }
    current_sign_in_ip { FFaker::Internet.ip_v4_address }
    last_sign_in_ip { FFaker::Internet.ip_v4_address }
    role { FFaker::Lorem.phrase }
    provider { FFaker::Lorem.phrase }
    discord_avatar_url { FFaker::Internet.http_url }
    token_expiry { FFaker::Time.date }
    factory :user_with_votes do
        transient do
          votes_count 3
        end
    
        after(:create) do |user, evaluator|
          FactoryGirl.create_list(:vote, evaluator.votes_count, vote: Vote)
        end
      end
    
      factory :user_with_collections do
        transient do
          collections_count 3
        end
    
        after(:create) do |user, evaluator|
          FactoryGirl.create_list(:collection, evaluator.collections_count, collection: Collection)
        end
      end
    
      factory :user_with_blueprints do
        transient do
          blueprints_count 3
        end
    
        after(:create) do |user, evaluator|
          FactoryGirl.create_list(:blueprint, evaluator.blueprints_count, blueprint: Blueprint)
        end
      end
  end
end
