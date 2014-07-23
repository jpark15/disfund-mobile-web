Expenditure.seed do |e|
  e.item = 'Chipotle'
  e.cost = 10
  e.quarterly_budget_id = 1
  e.purchase_date = 7/24/2014
  e.type_id = 1
  e.notes = 'Lunch Meeting'
  e.refunded = false
end

Expenditure.seed do |e|
  e.item = 'Chairs'
  e.cost = 40
  e.quarterly_budget_id = 1
  e.purchase_date = 7/25/2014
  e.type_id = 2
  e.notes = '10 new chairs'
  e.refunded = false
end
