require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new({ full_name: 'Trust', email: 'test3@test.com', password: '123456', password_confirmation: '123456' })
  end

  before { subject.save }

  it 'Full Name should be present' do
    subject.full_name = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'Password must have length greater then 6' do
    subject.password = '12345'
    expect(subject).to_not be_valid
  end
end
