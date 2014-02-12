class Event < ActiveRecord::Base
	validates :title, :organizer_name, presence: true
	validate :date_not_in_past
	validates :organizer_email, format: { with: /.+@.+\..{2,}/, message: "must be valid"}

	def date_not_in_past
		if date.nil? || date < Date.today
			errors.add(:date, "can't be in the past")
		end
	end 

end

# Prevent Events from being saved when: 
 # a. The events date is empty, 
 # in the past, or is not valid.
 #  b. The events title is already 
 #  taken or empty.
 #   c. The event organizers name 
 #   is empty. 
 #   d. The event organizers email 
 #   address is invalid.