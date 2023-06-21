class Request < ApplicationRecord
  after_initialize :set_default_status, :if => :new_record?

  belongs_to :user
  belongs_to :department, optional: true

  enum status: { open: 0, in_progress: 1, closed: 2 }
  enum urgency_level: { low: 0, medium: 1, high: 2 }

  private
  def set_default_status
    self.status ||= :open
  end
end
