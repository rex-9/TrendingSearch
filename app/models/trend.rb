class Trend < ApplicationRecord
  validates :keyword, presence: true, format: { multiline: true, with: /^[A-Z][a-zA-Z0-9\s]*[.?!]$/, message: "please enter keywords in correct format"}
  validates :searches, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
