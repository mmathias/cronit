require 'spec_helper'

describe "Business pages" do

  subject { page }

  describe "index" do
    let(:business) {FactoryGirl.create(:business)}
    before(:each) do
      sign_in business
      visit businesses_path
    end

    it {should have_title('All businesses')}
    it {should have_content('All businesses')}

    describe "pagination" do

      before(:all) {30.times {FactoryGirl.create(:business)}}
      after(:all) {Business.delete_all}

      it { should have_selector('div.pagination')}

      it "should list each business" do
        Business.paginate(page: 1).each do |business|
          expect(page).to have_selector('li', text: business.name)
        end  
      end
    end

    describe "delete links" do

      it {should_not have_link('delete')}

      describe "as an admin business" do
        let(:admin) { FactoryGirl.create(:admin)}

        before do
          sign_in admin
          visit businesses_path
        end

        it { should have_link('delete', href: business_path(Business.first))}

        it "should be able to delete another business" do
          expect { click_link('delete') }.to change(Business, :count).by(-1)
        end
        it { should_not have_link('delete', href: businesses_path(admin))}
      end
    end    
  end

  describe "profile page" do
    let(:business) { FactoryGirl.create(:business) }
    let!(:c1) { FactoryGirl.create(:calendar, user: business, start_date: 1.hour.from_now) }
    let!(:c2) { FactoryGirl.create(:calendar, user: business, start_date: 2.hour.from_now) }
    before { visit business_path(business) }

    it { should have_content(business.name) }
    it { should have_title(business.name) }

    describe "calendars" do
      it { should have_content(c1.start_date)}
      it { should have_content(c2.start_date)}
      it { should have_content(business.calendars.count)}
    end
    
  end

  describe "signup page" do
    before { visit signup_business_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end

  describe "signup business" do

    before { visit signup_business_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a business" do
        expect { click_button submit }.not_to change(Business, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Business"
        fill_in "Email",        with: "business@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
        fill_in "Logo url", with: "http://google.com"
        fill_in "Description", with: "Better business ever"
      end

      it "should create a business" do
        expect { click_button submit }.to change(Business, :count).by(1)
      end

      describe "after saving the business" do
        before { click_button submit }
        let(:business) { Business.find_by(email: 'business@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(business.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }

        describe "followed by signout" do
          before { click_link "Sign out" }
          it { should have_link('Sign in') }
        end
      end
    end
  end

  describe "edit" do
    let(:business) { FactoryGirl.create(:business)}
    before do
      sign_in business
      visit edit_business_path(business)
    end

    describe "page" do
      it { should have_content("Update your profile")}
      it { should have_title("Edit business")}
      it { should have_link('change', href: 'http://gravatar.com/emails')}
    end

    describe "with invalid information" do
      before{ click_button "Save changes"}
      it { should have_content('error')}      
    end

    describe "with valid information" do
      let(:new_name) {"New Name"} 
      let(:new_email) {"new@example.com"}
      before do 
        fill_in "Name", with: new_name
        fill_in "Email", with: new_email
        fill_in "Password", with: business.password
        fill_in "Confirm Password", with: business.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path)}
      specify { expect(business.reload.name).to eq(new_name)}
      specify { expect(business.reload.email).to eq(new_email)}

    end
  end  

end