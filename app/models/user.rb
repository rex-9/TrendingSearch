class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  validates :username, presence: true, length: { minimum: 3, maximum: 25 }
  validates :password, presence: true, length: { minimum: 6 }
  validates_confirmation_of :password
end
