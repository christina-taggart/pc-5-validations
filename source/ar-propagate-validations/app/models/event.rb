class Event < ActiveRecord::Base

  validates_presence_of :organizer_name, :organizer_email, :title, :date
  validates_uniqueness_of :title
  validates :organizer_email, format: {with: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, message: "must be a valid e-mail address"}
  validate :future_date

  def future_date
    if date && date < Date.today
      errors.add(:date, "can't be in the past")
    elsif date && date.year > 2015
      errors.add(:date, "can't be past Dec 31, 2015")
    end
  end


end
