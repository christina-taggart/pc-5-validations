require_relative '../config/environment'

describe "Event, an Active Record backed model" do
  it "should validate the presence of a title" do
    test_event = Event.new(organizer_name: "John",
                            organizer_email: "john@example.com",
                            date: Date.new(2014, 03, 15)
                          )
    test_event.save.should == false
  end

  it "should validate the uniqueness of a title" do
    test_event1 = Event.new(organizer_name: "John",
                            organizer_email: "john@example.com",
                            title: "Party",
                            date: Date.new(2014, 03, 15)
                          )
    test_event1.save.should == true
    test_event2 = Event.new(organizer_name: "John",
                            organizer_email: "john@example.com",
                            title: "Party",
                            date: Date.new(2014, 03, 15)
                          )
    test_event2.save.should == false
    test_event1.destroy
    test_event2.destroy
  end

  it "should validate the presence of an organizer name" do
    test_event = Event.new(organizer_name: "John",
                            title: "Party",
                            date: Date.new(2014, 03, 15)
                          )
    test_event.save.should == false
  end

  it "should validate the correct format of an email" do
    test_event = Event.new(organizer_name: "John",
                            organizer_email: "johnexamplecom",
                            title: "Party",
                            date: Date.new(2014, 03, 15)
                          )
    test_event.save.should == false
  end

  it "should validate the presence of a date" do
    test_event = Event.new(organizer_name: "John",
                            organizer_email: "john@example.com",
                            title: "Party",
                          )
    test_event.save.should == false
  end

  it "should validate that a date is not in the past" do
    test_event = Event.new(organizer_name: "John",
                            organizer_email: "john@example.com",
                            title: "Party",
                            date: Date.new(2001, 03, 15)
                          )
    test_event.save.should == false
  end
end