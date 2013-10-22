require 'spec_helper'

describe Product do
  subject{ product }

  let(:product) {FactoryGirl.create(:product)}

  its(:valid?) {should be_true}
  
  describe "validations" do
    it "requires name" do
      expect {product.name = nil}.to  change {product.valid?}.from(true).to(false)
    end
	it "requires description" do
      expect {product.description = nil}.to  change {product.valid?}.from(true).to(false)
    end
	it "requires price" do
      expect {product.price = nil}.to  change {product.valid?}.from(true).to(false)
    end
  end
end
