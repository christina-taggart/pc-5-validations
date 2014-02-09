class Event < ActiveRecord::Base
  validates_presence_of :organizer_name, :message => "You need to have an organizer name"
  validates :organizer_email, format: { with: /\A(.+)(@)(.+)(\.)(.+)\z/, message: "Your email isn't in the right format"}
  validates_presence_of :title, :message => "You need a title"
  validates_uniqueness_of :title, :message => "You can't use the same title again. Pick something different."
  validates_presence_of :date, :message => "You need to have a date for your event!"
  validates :date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/,
    message: "Your date isn't in the correct format 'YYYY-MM-DD'" }
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if date < Date.today
      errors.add(:date, "You can't set a date for your event that's in the past.")
    end
  end

end