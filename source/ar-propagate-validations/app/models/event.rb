class Event < ActiveRecord::Base
  validates :date, :title, :organizer_name, presence: true
  validates_format_of :organizer_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Email is invalid"
  validate :time_traveller

  def time_traveller
    begin
      errors.add(:past, "Event cannot be in the past") if date < Date.today
    rescue
      errors.add(:invalid_date, "Date is not valid")
    end
  end
end
