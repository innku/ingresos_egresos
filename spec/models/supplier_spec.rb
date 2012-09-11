require 'spec_helper'

describe 'Supplier' do 
  describe "validations" do
    let(:supplier) {FactoryGirl.build(:supplier)}
    
    it "is valid with valid attributes" do
      supplier.should be_valid
    end

    [:name, :rfc].each do |attr|
      it "is not valid with no #{attr}" do
        supplier.send("#{attr}=", nil)
        supplier.should_not be_valid
      end
    end
  end
end