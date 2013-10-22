require 'spec_helper'

describe Business do
  subject{ business }

  let(:business) {FactoryGirl.create(:business)}

  its(:valid?) {should be_true}
  
  describe "validations" do
    it "requires description" do
      expect {business.description = nil}.to  change {business.valid?}.from(true).to(false)
    end
  end
end
