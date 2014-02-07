require 'time'

class Event < ActiveRecord::Base
	validates :organizer_name, :organizer_email, :title, presence: true
	validates :title, uniqueness: true
	validates_format_of :organizer_email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validate :date_is_valid

	def date_is_valid
			invalid = false
		begin
			time = Time.parse(self.date)
		rescue
			invalid = true
		end
		errors.add(:date, " is invalid") if invalid
		errors.add(:date, "can't be in the past") if !invalid && time < Time.now 
	end
end
