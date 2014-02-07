class Event < ActiveRecord::Base
	validates :organizer_name, :organizer_email, :title, :date, presence: true
	validates :title, uniqueness: true 
	validates :organizer_email, format: { with: /^.+@.+(com)|(edu)|(gov)|(net)$/}
	validate :date_validator

	def date_validator
		if date.nil? || date < Date.today
			errors.add(:date, "can't be in the past.")	
		end
	end
end
