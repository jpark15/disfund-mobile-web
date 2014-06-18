json.array!(@expenditures) do |expenditure|
  json.extract! expenditure, :id, :item, :cost, :quarterly_budget_id, :purchase_date, :type_id, :notes, :refunded
  json.url expenditure_url(expenditure, format: :json)
end
