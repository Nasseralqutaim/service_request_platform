class Department < ApplicationRecord
  belongs_to :user
  has_many :tickets
  has_many :requests
end
