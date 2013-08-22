require 'spec_helper'

describe "Calendar pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "calendar creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a calendar" do
        expect { click_button "Post" }.not_to change(Calendar, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { select "2013", :from => 'calendar_start_date_1i' }
      before { select "August", :from => 'calendar_start_date_2i' }
      before { select "19", :from => 'calendar_start_date_3i' }
      before { select "19", :from => 'calendar_start_date_4i' }
      before { select "27", :from => 'calendar_start_date_5i' }
      before { fill_in 'calendar_how_often', with: "Lorem ipsum" }
      before { fill_in 'calendar_how_long', with: "Lorem ipsum" }
      it "should create a calendar" do
        expect { click_button "Post" }.to change(Calendar, :count).by(1)
      end
    end
  end
end