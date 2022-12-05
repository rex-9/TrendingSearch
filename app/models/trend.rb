class Trend < ApplicationRecord
  validates :keyword, presence: true
  validates :searches, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
