require 'rails_helper'

RSpec.describe Category, type: :model do
  current_user = User.first

  subject do
    Category.new({name: 'Grocery', icon: 'https://cdn-icons-png.flaticon.com/512/3588/3588658.png', user_id: 1})
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'should return only Categories created by the current user' do
    @categories = Category.created_by_current_user(current_user)
    current_user_id = @categories.first.user.id

    expect(current_user_id).to eq(current_user.id)
  end
end