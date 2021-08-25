FactoryGirl.define do
  factory :collection do
    name { FFaker::Lorem.phrase }
    type { rand(99) }
    slug { FFaker::Lorem.phrase }
    user
    factory :collection_with_blueprints do
        transient do
          blueprints_count 3
        end
    
        after(:create) do |collection, evaluator|
          FactoryGirl.create_list(:blueprint, evaluator.blueprints_count, blueprint: Blueprint)
        end
      end
  end
end
