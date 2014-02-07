class Event < ActiveRecord::Base
  validates :organizer_name, :organizer_email, 
    :title, :date , presence: true
  validates :title, uniqueness: true
end
