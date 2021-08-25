FactoryGirl.define do
  factory :mod do
    name { FFaker::Lorem.phrase }
    author { FFaker::Lorem.phrase }
    uuid4 { FFaker::Lorem.phrase }
    # versions TODO unknown field versions !
    factory :mod_with_blueprints do
        transient do
          blueprints_count 3
        end
    
        after(:create) do |mod, evaluator|
          FactoryGirl.create_list(:blueprint, evaluator.blueprints_count, blueprint: Blueprint)
        end
      end
  end
end
