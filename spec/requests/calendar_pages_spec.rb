require 'spec_helper'

describe "Calendar pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "calendar creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a calendar" do
        expect { click_button "Add" }.not_to change(Calendar, :count)
      end

      describe "error messages" do
        before { click_button "Add" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { select "2013", :from => 'calendar_start_date_1i' }
      before { select "August", :from => 'calendar_start_date_2i' }
      before { select "19", :from => 'calendar_start_date_3i' }
      before { select "19", :from => 'calendar_start_date_4i' }
      before { select "27", :from => 'calendar_start_date_5i' }
      before { fill_in 'calendar_how_often', with: "weekly" }
      before { fill_in 'calendar_how_long', with: "1 month" }

      before { find("#calendar_products_hash[type='hidden']").set("[{\"product_id\":\"351\",\"quantity\":2},{\"product_id\":\"16\",\"quantity\":2}]") }
      it "should create a calendar" do
        expect { click_button "Add" }.to change(Calendar, :count).by(1)
      end
    end
  end
end