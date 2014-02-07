class Event < ActiveRecord::Base
	validates :organizer_email, presence: true
	validates :organizer_name, presence: true 
	validates :date, presence: true
	validates :organizer_email, format: { with: /.+@.+\..{2,}/, message: ":  Must enter a valid email address"}
	validate :validate_date

	def validate_date
		check_date = self.date
			if !check_date
				errors.add(:date, ":  Date cannot be left blank")
			elsif check_date < Date.today
				errors.add(:date, ":  Date must be in the future") 
		end
	end
end

