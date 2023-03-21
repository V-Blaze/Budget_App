require 'rails_helper'
require 'capybara/rspec'

base_url = 'http://localhost:3000'

RSpec.feature 'Categories#index view', type: :feature, js: true do
  before(:each) do
    @current_user = User.first
    @current_user.confirm if @current_user.confirmed_at.nil?
    @category = Category.created_by_current_user(@current_user).first

    visit "#{base_url}/categories"
    fill_in 'Email', with: @current_user.email
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  scenario "Displaying Category's name" do
    # Wait until the recipe name appears on the page
    expect(page).to have_content(@category.name, wait: 5)

    # Now make the assertion
    expect(body).to have_content(@category.name)
  end

  scenario 'Displaying button link to create new category' do
    # wait
    expect(page).to have_css('.add-new-category-btn', wait: 5)
    # Make Assertion
    expect(page).to have_css('.add-new-category-btn')
  end

  scenario 'Clicking on the add new category button redirects to /categories/new' do
    add_btn = page.all(:css, '.add-new-category-btn').first
    expected_url = "#{base_url}/categories/new"

    add_btn.click
    expect(page).to have_current_path(expected_url)
  end

  scenario 'Clicking on a category item redirects to /categories/:category_id/expenses' do
    cat_item = page.all(:css, '.category-name').first
    expected_url = "#{base_url}/categories/#{@category.id}/expenses"

    cat_item.click
    expect(page).to have_current_path(expected_url)
  end

end