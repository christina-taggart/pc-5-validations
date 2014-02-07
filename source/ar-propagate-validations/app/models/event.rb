class Event < ActiveRecord::Base
  validates :organizer_name, :organizer_email, 
    :title, :date , presence: true
  validates :title, uniqueness: true
  validates :organizer_email, format: { 
    with: /[^!#\$%^&*](\w|\d)+@.+\..+/, 
    message: "invalid email address" 
  }
  validates :date, format: { 
    with: /^\d{4}-\d{2}-\d{2}$/, 
    message: "invalid date format: please use DD/MM/YYYY from the date picker" 
  }
  validate :date_cannot_be_in_the_past
  
  def date_cannot_be_in_the_past
    today = Chronic.parse('today')
    event_date = Chronic.parse(self.date)
    unless event_date.today? || event_date > today
      errors.add(:date, "event cant be in the past")
    end
  end
end
