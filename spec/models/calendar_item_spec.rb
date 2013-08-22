require 'spec_helper'

describe CalendarItem do
  subject{ calendar_item }

  let(:calendar) {FactoryGirl.create(:calendar)}
  let(:calendar_item) {FactoryGirl.create(:calendar_item, calendar: :calendar)}

  its(:valid?) {should be_true}
  
  describe "validations" do
    it "requires execution_date" do
      expect {calendar_item.execution_date = nil}.to change {calendar_item.valid?}.from(true).to(false)
    end
    it "requires done" do
      expect {calendar_item.done = nil}.to change {calendar_item.valid?}.from(true).to(false)
    end
    it "requires calendar_id" do
      expect {calendar_item.calendar_id = nil}.to change {calendar_item.valid?}.from(true).to(false)
    end
  end
end
