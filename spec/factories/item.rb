FactoryGirl.define do
  factory :item do
    name 'Chipotle'
    description 'Burrito'
    cost 10

    association :settings_type
  end
end