json.array!(@quarterly_budgets) do |quarterly_budget|
  json.extract! quarterly_budget, :id, :start_balance, :current_balance, :end_balance, :quarter, :year
  json.url quarterly_budget_url(quarterly_budget, format: :json)
end
