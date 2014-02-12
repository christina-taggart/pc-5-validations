class Event < ActiveRecord::Base
  validates :organizer_name, :presence => {:message => "don't leave empty"}
  validates :organizer_email, :presence => {:message => "don't leave empty"}
  validates :date, :presence => {:message => "don't leave empty"}
  validates :title, :presence => {:message => "don't leave empty"}
  validates :title, :uniqueness => {:message => "not unique!"}
  validates :organizer_email, :format => { :with => /^.+@.+\..+/, :message => "Please enter a valid email"}
  validate :date, :check?

  def check?
    if Date.today > self.date
      errors.add(:date, "can't go back in time just now!!")
    end
  end

end

# Prevent Events from being saved when:
#   a. The events date is empty, in the past, or is not valid.
#   b. The events title is already taken or empty.
#   c. The event organizers name is empty.
#   d. The event organizers email address is invalid.