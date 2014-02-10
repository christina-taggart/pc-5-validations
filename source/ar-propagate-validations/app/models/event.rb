require 'date' 

class Event < ActiveRecord::Base
	validates :organizer_name, presence: true
	validates_format_of :organizer_email, 
		:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	validates :title, presence: true, uniqueness: true
	validates :date, presence: true
	validates_with FutureDateValidator

end
