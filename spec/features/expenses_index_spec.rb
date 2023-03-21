require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

RSpec.feature 'Expenses#index view', type: :feature, js: true do
  before(:each) do
    @current_user = User.first
    @current_user.confirm if @current_user.confirmed_at.nil?
    @category = Category.created_by_current_user(@current_user).last
    @expenses = Expense.joins(:categories).where(categories: { id: @category.id }).order(created_at: :desc)
    @expense = @expenses.first

    visit "#{base_url}/categories/#{@category.id}/expenses"
    fill_in 'Email', with: @current_user.email
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  scenario "Displaying at least one expense's name" do
    # Wait until the recipe name appears on the page
    expect(page).to have_content(@expense.name, wait: 5)

    # Now make the assertion
    expect(body).to have_content(@expense.name)
  end

  scenario "Displaying Category's expenses total amount" do
    total_expense = @expenses.inject(0) { |sum, e| sum + e.amount }
    # Wait until the recipe name appears on the page
    expect(page).to have_content(total_expense, wait: 5)

    # Now make the assertion
    expect(body).to have_content(total_expense)
  end

  scenario 'Displaying button link to create new Expense' do
    # wait
    expect(page).to have_css('.add-new-expense-btn', wait: 5)
    # Make Assertion
    expect(page).to have_css('.add-new-expense-btn')
  end
end

RSpec.feature 'Expenses#index view', type: :feature, js: true do
  before(:each) do
    @current_user = User.first
    @current_user.confirm if @current_user.confirmed_at.nil?
    @category = Category.created_by_current_user(@current_user).last
    @expenses = Expense.joins(:categories).where(categories: { id: @category.id }).order(created_at: :desc)
    @expense = @expenses.first

    visit "#{base_url}/categories/#{@category.id}/expenses"
    fill_in 'Email', with: @current_user.email
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end
  scenario 'Clicking on the add new category button redirects to /categories/:category_id/expenses/new' do
    add_btn = page.all(:css, '.add-new-expense-btn').first
    expected_url = "#{base_url}/categories/#{@category.id}/expenses/new"

    add_btn.click
    expect(page).to have_current_path(expected_url)
  end

  scenario 'Clicking on the back button takes you to the home page' do
    back_btn = page.all(:css, '.back-btn').first
    expected_url = base_url.to_s

    back_btn.click
    expect(page).to have_current_path(expected_url)
  end
end
