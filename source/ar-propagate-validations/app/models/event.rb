class DateValidator < ActiveModel::Validator
  def validate(record)
    date = record.date
    if date < Date.today
      record.errors[:base] << "Date cannot be in the past."
    elsif !Date.valid_date?(date.year, date.month, date.day)
      record.errors[:base] << "Date must be valid."
    end
  end
end

class Event < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :organizer_name, presence: true
  validates :email, format: { with: /.*@.*\..*/ }
  validates :date, presence: true
end
