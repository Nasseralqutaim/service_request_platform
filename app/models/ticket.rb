class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :department
  enum status: [:open, :in_progress, :closed]

end
