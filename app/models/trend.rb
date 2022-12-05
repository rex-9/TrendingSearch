class Trend < ApplicationRecord
  has_many :user_trends
  has_many :users, through: :user_trends

  validates :keyword, presence: true, format: { multiline: true, with: /^[A-Z][a-zA-Z0-9\s]*[.?!]$/, message: "please enter keywords in correct format"}
  validates :popularity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
