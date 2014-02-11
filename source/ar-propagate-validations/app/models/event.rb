class Event < ActiveRecord::Base
  validates_presence_of :title, message: "You must include the title"
  validates_presence_of :organizer_name, message: "You must include the organizer's name"
  validates_presence_of :organizer_email, message: "You must include the organizer's email"
  validates_presence_of :date, message: "You must include the date"
  validates_uniqueness_of :title, message: "Title already taken."
  validates_format_of :organizer_email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create, message: "Email is invalid"
  validate :date_cannot_be_in_the_past

    def date_cannot_be_in_the_past
      if !date.nil? && date < Date.today
        errors.add(:date, "Date cannot be in the past.")
      end
    end

end
