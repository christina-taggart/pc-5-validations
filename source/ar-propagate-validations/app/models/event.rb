class Event < ActiveRecord::Base
  validates :title, :organizer_name, :organizer_email, :date, presence: true
  validates :title, uniqueness: true
  validates_format_of :organizer_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validate :date_cannot_be_in_the_past

    def date_cannot_be_in_the_past
      if !date.nil? && date < Date.today
        errors.add(:date, "Date cannot be in the past.")
      end
    end

end
