require 'spec_helper'

describe CalendarItem do
  let(:calendar) {FactoryGirl.create(:calendar_with_items)}

  before{ @calendar_item = calendar.calendar_items.build(execution_date: Time.now()) }
  
  subject{ @calendar_item }
  
  it { should respond_to(:execution_date)}
  it { should respond_to(:done)}
  it { should respond_to(:calendar)}
  
  its (:calendar) { should eq calendar}

  it{should be_valid}
  
  describe "when execution_date is not present" do
    before {@calendar_item.execution_date = nil}
    it{should_not be_valid}
  end
  describe "when done is not present" do
    before {@calendar_item.done = nil}
    it{should_not be_valid}
  end
  describe "when calendar is not present" do
    before {@calendar_item.calendar = nil}
    it{should_not be_valid}
  end
end
