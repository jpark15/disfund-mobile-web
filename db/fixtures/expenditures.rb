Expenditure.seed do |e|
  e.id = 1
  e.item = 'Chipotle'
  e.cost = 100
  e.quarterly_budget_id = 1
  e.purchase_date = '2013-07-12'
  e.type_id = 1
  e.notes = 'Lunch Meeting'
  e.refunded = false
end

Expenditure.seed do |e|
  e.id = 2
  e.item = 'Chairs'
  e.cost = 400
  e.quarterly_budget_id = 1
  e.purchase_date = '2013-8-30'
  e.type_id = 2
  e.notes = '10 new chairs'
  e.refunded = false
end

Expenditure.seed do |e|
  e.id = 3
  e.item = 'Welcome Lunch'
  e.cost = 80
  e.quarterly_budget_id = 1
  e.purchase_date = '2013-9-15'
  e.type_id = 3
  e.notes = 'Lunch for new hires!'
  e.refunded = false
end

Expenditure.seed do |e|
  e.id = 4
  e.item = 'Subway'
  e.cost = 100
  e.quarterly_budget_id = 2
  e.purchase_date = '2013-10-2'
  e.type_id = 1
  e.notes = 'Quarterly offsite'
  e.refunded = false
end

Expenditure.seed do |e|
  e.id = 5
  e.item = 'Desks'
  e.cost = 600
  e.quarterly_budget_id = 2
  e.purchase_date = '2013-11-12'
  e.type_id = 2
  e.notes = '10 new desks'
  e.refunded = false
end

Expenditure.seed do |e|
  e.id = 6
  e.item = 'Festive Friday'
  e.cost = 110
  e.quarterly_budget_id = 2
  e.purchase_date = '2013-12-17'
  e.type_id = 3
  e.notes = 'For fun!'
  e.refunded = false
end
