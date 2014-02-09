require 'spec_helper'

describe Event do
	it { should respond_to :organizer_name }
	it { should respond_to :organizer_email }
	it { should respond_to :title }
	it { should respond_to :date }
end