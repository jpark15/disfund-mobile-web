FactoryGirl.define do
  factory :expenditure do
    item "Default Item"
    cost "0.00"
    purchase_date "7/10/1993"
    notes "Default Notes"
    refunded false

    association :quarterly_budget, quarter: 2
    association :settings_type
  end
end