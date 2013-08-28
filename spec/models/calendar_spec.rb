require 'spec_helper'

describe Calendar do
  subject{ calendar }
  
  let(:calendar) {FactoryGirl.create(:calendar, user: FactoryGirl.create(:user))}
  
  
  #it { should respond_to(:start_date)}
  #it { should respond_to(:how_often)}
  #it { should respond_to(:how_long)}
  #it { should respond_to(:user_id)}
  #it { should respond_to(:user)}
  #it { should respond_to(:calendar_items)}
  #it { should respond_to(:actions)}
  
  its(:valid?) {should be_true}

  #it{should be_valid}
  describe "validations" do
    
    it "requires user_id" do
      expect(:calendar.user_id = nil).to change (calendar.valid?).from(true).to(false)
    end
    it "requires start_date" do
      expect(:calendar.start_date = nil).to change (calendar.valid?).from(true).to(false)
    end
    it "requires how_often" do
      expect(:calendar.how_often = nil).to change (calendar.valid?).from(true).to(false)
    end
    it "requires how_long" do
      expect(:calendar.how_long = nil).to change (calendar.valid?).from(true).to(false)
    end
    
    describe "calendar_items associations" do
      before {calendar.save}

      let!(:older_calendar_item) do
        FactoryGirl.create(:calendar_item, calendar: calendar, execution_date: 1.hour.from_now, done: false)
      end
      let!(:newer_calendar_item) do
        FactoryGirl.create(:calendar_item, calendar: calendar, execution_date: 1.day.from_now, done: false)
      end

      it "should have the right calendar_items in the right order" do
        expect(calendar.calendar_items.to_a).to eq [older_calendar_item, newer_calendar_item]
      end

      it "should destroy calendar_items" do
        calendar_items = calendar.calendar_items.to_a
        calendar.destroy
        expect(calendar_items).not_to be_empty
        calendar_items.each do |calendar_item|
          expect(CalendarItem.where(id:calendar_item.id)).to be_empty
        end
      end
    end
    describe "actions associations" do
      before {@calendar.save}

      let!(:newer_action) do
        FactoryGirl.create(:action, calendar: @calendar, created_at: 1.hour.ago)
      end
      let!(:older_action) do
        FactoryGirl.create(:action, calendar: @calendar, created_at: 1.day.ago)
      end

      it "should have the right action in the right order" do
        expect(@calendar.actions.to_a).to eq [newer_action, older_action]
      end

      it "should destroy actions" do
        actions = @calendar.actions.to_a
        @calendar.destroy
        expect(actions).not_to be_empty
        actions.each do |action|
          expect(Action.where(id:action.id)).to be_empty
        end
      end
    end
  end
end
