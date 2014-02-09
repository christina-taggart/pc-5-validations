class Event < ActiveRecord::Base
  validates :organizer_name, presence: true
  validates :organizer_email, presence: true
  validates :organizer_email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: "must be a valid email address like: name@example.com" }
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :date, presence: true
  validate :date, :date_valid?

  def date_valid?
    if Date.today > self.date
      errors.add(:date, "must be in the future.")
    end
  end

end



