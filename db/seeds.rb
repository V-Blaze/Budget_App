# include Devise's helpers
include Devise::Controllers::Helpers

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.new({ full_name: 'Trust', email: 'test1@test.com', password: '123456', password_confirmation: '123456' })
second_user = User.new({ full_name: 'Valentine', email: 'test2@test.com', password: '123456', password_confirmation: '123456' })

# Generate the confirmation token and set the confirmed at timestamp first user
confirmation_token = Devise.token_generator.generate(User, :confirmation_token)
first_user.confirmation_token = confirmation_token[0]
first_user.confirmed_at = Time.now.utc

# Save the user to the database
if first_user.save!
    puts 'First user created successfully...'
end


# Generate the confirmation token and set the confirmed at timestamp first user
confirmation_token = Devise.token_generator.generate(User, :confirmation_token)
second_user.confirmation_token = confirmation_token[0]
second_user.confirmed_at = Time.now.utc

# Save the user to the database
if second_user.save!
    puts 'Second user created successfully...'
end

first_category = Category.create({name: 'Sport', icon: 'https://cdn-icons-png.flaticon.com/512/2112/2112215.png', user_id: 1})
second_category = Category.create({name: 'Entertainment', icon: 'https://cdn-icons-png.flaticon.com/512/3588/3588658.png', user_id: 1})

Expense.create([
    {name: 'PS4', amount: 250, author_id: 1, categories: [first_category]},
    {name: 'Xbox', amount: 75, author_id: 1, categories: [first_category]}
])
