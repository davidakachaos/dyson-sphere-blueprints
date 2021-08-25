FactoryGirl.define do
  factory :blueprint do
    title { FFaker::Lorem.phrase }
    # encoded_blueprint TODO unknown field encoded_blueprint !
    slug { FFaker::Lorem.phrase }
    mod_version { FFaker::Lorem.phrase }
    cached_votes_total { rand(99) }
    cached_votes_score { rand(99) }
    cached_votes_up { rand(99) }
    cached_votes_down { rand(99) }
    cached_weighted_score { rand(99) }
    cached_weighted_total { rand(99) }
    cached_weighted_average { rand + rand(6) }
    # summary TODO unknown field summary !
    # cover_picture_data TODO unknown field cover_picture_data !
    collection
    mod
    user
    rich_text_description
    factory :blueprint_with_votes_for do
        transient do
          votes_for_count 3
        end
    
        after(:create) do |blueprint, evaluator|
          FactoryGirl.create_list(:votes_for, evaluator.votes_for_count, votes_for: VotesFor)
        end
      end
    
      factory :blueprint_with_taggings do
        transient do
          taggings_count 3
        end
    
        after(:create) do |blueprint, evaluator|
          FactoryGirl.create_list(:tagging, evaluator.taggings_count, tagging: Tagging)
        end
      end
    
      factory :blueprint_with_base_tags do
        transient do
          base_tags_count 3
        end
    
        after(:create) do |blueprint, evaluator|
          FactoryGirl.create_list(:base_tag, evaluator.base_tags_count, base_tag: BaseTag)
        end
      end
    
      factory :blueprint_with_tag_taggings do
        transient do
          tag_taggings_count 3
        end
    
        after(:create) do |blueprint, evaluator|
          FactoryGirl.create_list(:tag_tagging, evaluator.tag_taggings_count, tag_tagging: TagTagging)
        end
      end
    
      factory :blueprint_with_tags do
        transient do
          tags_count 3
        end
    
        after(:create) do |blueprint, evaluator|
          FactoryGirl.create_list(:tag, evaluator.tags_count, tag: Tag)
        end
      end
    
      factory :blueprint_with_additional_pictures do
        transient do
          additional_pictures_count 3
        end
    
        after(:create) do |blueprint, evaluator|
          FactoryGirl.create_list(:additional_picture, evaluator.additional_pictures_count, additional_picture: AdditionalPicture)
        end
      end
  end
end
