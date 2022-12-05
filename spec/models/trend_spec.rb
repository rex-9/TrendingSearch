require 'rails_helper'

RSpec.describe Trend, type: :model do
  subject { Trend.new(keyword: 'What is the ending of One Piece?') }

  before { subject.save }

  it 'Keyword is required' do
    subject.keyword = nil
    expect(subject).to_not be_valid
  end

  it 'Keyword is VALID (Starts with Capital and Ends with ?)' do
    subject.keyword = 'What is the ending of One Piece?'
    expect(subject).to be_valid
  end

  it 'Keyword is VALID (Starts with Capital and Ends with .)' do
    subject.keyword = 'The ending of One Piece.'
    expect(subject).to be_valid
  end

  it 'Keyword is VALID (Starts with Capital and Ends with !)' do
    subject.keyword = 'Why is Elden Ring so Marvelous!'
    expect(subject).to be_valid
  end

  # Invalid Test Cases are in the Controller Spec
end
