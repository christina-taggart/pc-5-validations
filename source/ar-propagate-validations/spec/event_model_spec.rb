require 'spec_helper'
require 'date'

describe Event do
	before :all do
		@event = Event.create(organizer_name: 'henry', organizer_email: 'henry@hens.com', 
												title: 'the original', date: Date.today)
	end

	after :all do
		@event.destroy
	end

	specify { expect(subject).to respond_to :organizer_name }
	specify { expect(subject).to respond_to :organizer_email }
	specify { expect(subject).to respond_to :title }
	specify { expect(subject).to respond_to :date }
	specify { expect(subject).to validate_presence_of(:date) }
	specify { expect(subject).to validate_presence_of(:title) }
	specify { expect(subject).to validate_uniqueness_of(:title) }
	specify { expect(subject).to validate_presence_of(:organizer_name) }

	describe 'date validations' do
		it 'will not save events with dates in past' do
			event = Event.new(organizer_name: 'henry', organizer_email: 'henry@hens.com', 
													title: 'the henfest', date: Date.today-1)
			expect(event).not_to be_valid
		end

		it 'will not save an event with invalid date' do
			bad_date_str = Date.today.to_s
			bad_date_str[5] = '5'
			event = Event.new(organizer_name: 'henry', organizer_email: 'henry@hens.com', 
													title: 'the henfest', date: bad_date_str)
			expect(event).not_to be_valid
		end
	end

	describe 'email validation' do
		it 'will not save with an invalid email' do
			event = Event.new(organizer_name: 'henry', title: 'the henfest',
													 date: Date.today)
			event.organizer_email = 'pp'
			expect(event).not_to be_valid
		end
	end
end