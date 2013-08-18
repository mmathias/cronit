require 'spec_helper'

describe Calendar do
  let(:user) {FactoryGirl.create(:user)}

  before{ @calendar = user.calendars.build(start_date: DateTime.new(), how_often: 'everyweek', how_long: '1year') }
  
  subject{ @calendar }
  
  it { should respond_to(:start_date)}
  it { should respond_to(:how_often)}
  it { should respond_to(:how_long)}
  it { should respond_to(:user_id)}
  it { should respond_to(:user)}
  it { should respond_to(:calendar_items)}
  it { should respond_to(:actions)}
  
  its (:user) { should eq user}

  it{should be_valid}
  
  describe "when user_id is not present" do
    before {@calendar.user_id = nil}
    it{should_not be_valid}
  end
  describe "when start_date is not present" do
    before {@calendar.start_date = nil}
    it{should_not be_valid}
  end
  describe "when how_often is not present" do
    before {@calendar.how_often = nil}
    it{should_not be_valid}
  end
#  describe "calendar_items associations" do
#    before {@calendar.save}
#    
#    let!(:older_calendar_item) do
#      FactoryGirl.create(:calendar_items, calendar: @calendar, execution_date: 1.hour.from_now, done: false)
#    end
#    let!(:newer_calendar_item) do
#      FactoryGirl.create(:calendar_items, calendar: @calendar, execution_date: 1.day.from_now, done: false)
#    end
    
#    it "should have the right calendar_items in the right order" do
#      expect(@calendar.calendar_items.to_a).to eq [older_calendar_item, newer_calendar_item]
#    end
#    
#    it "when calendar_items is not created" do
#      before {@calendar.calendar_items = nil}
#      it{should_not be_valid}
#    end
    
#    it "should destroy calendar_items" do
#      calendar_items = @calendar.calendars.to_a
#      @calendar.destroy
#      expect(calendar_items).not_to be_empty
#      calendar_items.each do |calendar_item|
#        expect(CalendarItem.where(id:calendar_item.id)).to be_empty
#      end
#    end
#    
#  end
#  describe "when actions is not present" do
#    before {@calendar.actions = nil}
#    it{should_not be_valid}
#  end
end
