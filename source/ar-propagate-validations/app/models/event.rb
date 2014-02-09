class Event < ActiveRecord::Base
	validate :date, :date_cannot_be_in_the_past
	validate :title, :date, :organizer_name, :presence => true
	validate :title, :organizer_email, :uniqueness => true
	validate :organizer_email, :valid_email
	def date_cannot_be_in_the_past
	    if !date.blank? and date < Date.today
	      errors.add(:date, "can't be in the past")
	  	end
	end

	def date_must_be_valid
		if !date.blank? and Chronic.parse(date)
			errors.add(:date, "invalid date")
		end
	end

	 def valid_email
	 	if !organizer_email.match(/.*@{1}.*\..{3}/)
	 		errors.add(:email, "email not valid")
	 	end
	 end

end


