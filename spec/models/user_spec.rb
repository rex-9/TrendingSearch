require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'Rex', password: 'password') }

  before { subject.save }

  it 'Username is required' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  it 'Username is INVALID (should not be less than 3 characters)' do
    subject.username = 'Rx'
    expect(subject).to_not be_valid
  end

  it 'Username is VALID (more than 3 characters)' do
    subject.username = 'Rex'
    expect(subject).to be_valid
  end

  it 'Password is required' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'Password is INVALID (should not be less than 6 characters)' do
    subject.password = 'pass'
    expect(subject).to_not be_valid
  end
end
