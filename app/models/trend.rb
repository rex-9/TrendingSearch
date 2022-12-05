class Trend < ApplicationRecord
  validates :keyword, presence: true, uniqueness: true
  validates :searches, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
