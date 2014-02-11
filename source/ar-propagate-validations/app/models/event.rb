class Event < ActiveRecord::Base
	#date not empty, not in the past or invalid
	validates_presence_of :date, :message => "An event needs a date"
	validate :valid_date

	def valid_date
		if !date.nil? && date < Date.today
			errors.add(:date, "Too late to book that event sir")
		end
	end
	#no dupe event title
	validates_uniqueness_of :title, :message => "No duplicate events allowed"
	#no empty name
	validates_presence_of :organizer_name, :message => "Name required to register an event"
	#valid email only
	validates_presence_of :organizer_email, :message => "Valid Email required to register an event"
	validates_format_of :organizer_email, :with => /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/, :on => :create, :message => "Invalid email format"
end
