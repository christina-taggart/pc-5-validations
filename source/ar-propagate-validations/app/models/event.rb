class Event < ActiveRecord::Base
  validates :organizer_name, :organizer_email, 
    :title, :date , presence: true
  validates :title, uniqueness: true
  validates :organizer_email, format: { with: /[^!#\$%^&*](\w|\d)+@.+\..+/, message: "invalid email address"}
end
