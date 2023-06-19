class Request < ApplicationRecord
  belongs_to :user
  belongs_to :department

  enum status: { open: 0, in_progress: 1, closed: 2 }
  enum urgency_level: { low: 0, medium: 1, high: 2 }
end
