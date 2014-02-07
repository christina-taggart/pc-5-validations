class Event < ActiveRecord::Base
  validates :date, presence: true
  validates :title, presence: true
  validates :organizer_name, presence:true
  validates :title, uniqueness: true
  validates :organizer_email, format: {with: /^.+@.+\..{2,}$/}
  validate :date_is_valid

  def date_is_valid
    errors.add(:date, "must be in the future") if date.past?
  end

end
