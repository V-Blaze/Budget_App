require 'rails_helper'

RSpec.describe Expense, type: :model do
  current_user = User.first
  first_category = Category.first

  subject do
    Expense.new({name: 'PS4', amount: 250, author: current_user, categories: [first_category]},)
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Array of categories should be present' do
    @categories = subject.categories

    expect(@categories.length).to eq(1)
  end

  it 'Author id must equal to the current_user id' do
    @author = subject.author

    expect(@author.id).to eq(current_user.id)
  end
end