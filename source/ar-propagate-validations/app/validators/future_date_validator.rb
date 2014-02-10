require 'date' 

class FutureDateValidator < ActiveModel::Validator
  def validate(record)
    if record.date && record.date < Date.today
      record.errors[:base] << "Date must be today or later"
    end
  end
end