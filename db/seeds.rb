House.create(name: 'Hacker House', address: '717 California St, San Francisco, CA')

User.create(email: "colleen.michelle.mccloskey@gmail.com",
 house_id: 1,
 name: "Colleen McCloskey",
 image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash1/372191_17501268_692354827_q.jpg",
 password: "passwordpassword",
 password_confirmation: "passwordpassword",
 points: 10 )

User.create(email: "fabian.uribe@gmail.com",
 house_id: 1,
 name: "Fabian Uribe",
 image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn1/157423_21003946_1486979321_q.jpg",
 password: "passwordpassword",
 password_confirmation: "passwordpassword",
 points: 10 )

Invitation.create(
  email: "taboulidude@yahoo.com",
  user_id: 2
  )

House.first.chores.create(title: "Do the dishes", house_id: 1, points: 15, frequency: 1, due_date: "2013-09-13")
House.first.chores.create(title: "Mop the kitchen", house_id: 1, points: 25, frequency: 7, due_date: "2013-09-14")
House.first.chores.create(title: "Clean the bathroom", house_id: 1, points: 60, frequency: 7, due_date: "2013-09-16")

House.first.grocery_lists.create(name: "Dairy Products")
GroceryList.last.grocery_items.create(name: "Milk")
GroceryList.last.grocery_items.create(name: "Yogurt")
GroceryList.last.grocery_items.create(name: "Cheese")

House.first.grocery_lists.create(name: "Alcohol")
GroceryList.last.grocery_items.create(name: "Beer")
GroceryList.last.grocery_items.create(name: "Red wine")
GroceryList.last.grocery_items.create(name: "White wine")
GroceryList.last.grocery_items.create(name: "Vodka")

House.first.grocery_lists.create(name: "Poultry")
GroceryList.last.grocery_items.create(name: "Steak")
GroceryList.last.grocery_items.create(name: "Ham")
GroceryList.last.grocery_items.create(name: "Turkey breast")
GroceryList.last.grocery_items.create(name: "Eggs")
GroceryList.last.grocery_items.create(name: "Chicken")

Expense.create(purchaser_id: 2, name: "Rent", total_cents: 350000, description: "September's rent.", purchased_on: "2013-09-01", contributor_ids:"1")
Expense.create(purchaser_id: 1, name: "Plumber Visit", total_cents: 20000, description: "Sink broke down needed the fix.", purchased_on: "2013-09-03" , contributor_ids:"2")
Expense.create(purchaser_id: 1, name: "Cable Bill", total_cents: 6000, description: "Sink broke down needed the fix.", purchased_on: "2013-09-03" , contributor_ids:"2")

Payment.create(borrower_id: 1, lender_id: 2, description: 'Advance on the rent', amount_cents: 100000, date: "2013-09-02", method: "cash" )
Payment.create(borrower_id: 1, lender_id: 2, description: 'Seccond payment of septembers rent.', amount_cents: 20000, date: "2013-09-03", method: "cash" )

User.first.grocery_lists << GroceryList.all
User.last.grocery_lists << GroceryList.last