class Event < ActiveRecord::Base
  validates :title, :organizer_name, :organizer_email, :date, presence: true
  validates :title, uniqueness: true
  # validates :date, format: {with: "%DD-%MM-%YYYY"), message: "Enter a valid date."}
  validates :organizer_email, format: {with: /^([a-zA-Z0-9&_?\/`!|#*$^%=~{}+'-]+|"([\x00-\x0C\x0E-\x21\x23-\x5B\x5D
  -\x7F]|\\[\x00-\x7F])*")(\.([a-zA-Z0-9&_?\/`!|#*$^%=~{}+'-]+|"([\x00-\
  x0C\x0E-\x21\x23-\x5B\x5D-\x7F]|\\[\x00-\x7F])*"))*@([a-zA-Z0-9&_?\/`!
  |#*$^%=~{}+'-]+|\[([\x00-\x0C\x0E-\x5A\x5E-\x7F]|\\[\x00-\x7F])*\])(\.
  ([a-zA-Z0-9&_?\/`!|#*$^%=~{}+'-]+|\[([\x00-\x0C\x0E-\x5A\x5E-\x7F]|\\[
  \x00-\x7F])*\]))*$/, message: "Email is invalid."}
  
  validate :date_cannot_be_in_the_past

    def date_cannot_be_in_the_past
      if !date.blank? && date < Date.today
        errors.add(:date, "Date cannot be in the past.")
      end
    end

end
