class Event < ActiveRecord::Base
  validates :date, :title, :organizer_name, presence: true
  validates_format_of :organizer_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Email is invalid"
  validate :event_date_must_be_valid_and_in_future

  def event_date_must_be_valid_and_in_future
    begin
      errors.add(:past_date, "Event cannot be in the past") if date < Date.today
    rescue
      errors.add(:date_not_valid, "Date is not valid")
    end
  end
end
