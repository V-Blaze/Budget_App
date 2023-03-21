# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
    { full_name: 'Trust', email: 'test1@test.com', password: '123456', password_confirmation: '123456' },
    { full_name: 'Valentine', email: 'test2@test.com', password: '123456', password_confirmation: '123456' }
   ])

first_category = Category.create({name: 'Sport', icon: 'https://cdn-icons-png.flaticon.com/512/2112/2112215.png', user_id: 1})
Category.create({name: 'Entertainment', icon: 'https://cdn-icons-png.flaticon.com/512/3588/3588658.png', user_id: 1})

Expense.create([
    {name: 'PS4', amount: 250, author_id: 1, categories: [first_category]},
    {name: 'Xbox', amount: 75, author_id: 1, categories: [first_category]}
])
