class User < ApplicationRecord
  has_many :requests
  has_secure_password
  has_many :departments
  has_many :tickets
  # has_many :tickets, through: :departments
  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
end
