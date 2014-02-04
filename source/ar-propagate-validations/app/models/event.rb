class Event < ActiveRecord::Base
	
	validates_presence_of :organizer_name, :message => "Organizer name cannot be blank"
	validates_presence_of :organizer_email, :message => "Organizer email cannot be blank"
	validates :organizer_email, :format => {:with => /^.+@.+\..+/, :message => "Email address not valid"}
	validate :title, uniqueness: true, :message => "Event name has already been taken"
	validates_presence_of :date, :message => "Date cannot be empty"
	validate :date_must_be_in_future

	def date_must_be_in_future
		if !date.nil? && date < Date.today
			errors.add(:date, "Date can't be in the past")
		end
	end
end
