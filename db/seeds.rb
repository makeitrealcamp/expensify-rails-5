Category.create!([
  {category: "Restaurants"},
  {category: "Grocery"},
  {category: "Car"},
  {category: "Services"}
])
Expense.create!([
  {concept: "Almuerzo", value: "25000.0", date: "2016-12-24", category_id: 1, type_id: 4},
  {concept: "Recibo de luz", value: "45000.0", date: "2016-11-01", category_id: 4, type_id: 3}
])
Type.create!([
  {name: "Purchase"},
  {name: "Withdrawal"},
  {name: "Transfer"},
  {name: "Payment"}
])
