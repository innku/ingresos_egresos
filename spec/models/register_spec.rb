require 'spec_helper'

describe "Register" do
  describe "validations" do
    let(:register) { FactoryGirl.build(:register) }

    it "is valid with valid attributes" do
      register.should be_valid
    end

    [:name, :date, :kind, :folio, :amount].each do |attr|
      it "is not valid with no #{attr}" do
        register.send("#{attr}=", nil)
        register.should_not be_valid
      end
    end

    it "is invalid with a fake date" do
      register.date = "12-13-2012"
      register.should_not be_valid
    end
    
    it "is invalid with a kind different of income or egress" do
      register.kind = "algo"
      register.should_not be_valid
    end

    it "is invalid with a negative amount" do
      register.amount = -2
      register.should_not be_valid
    end
  end
  
  describe ".by_created_at" do
    it "orders the registers by creation date from oldest to newest" do
      oldest_register = FactoryGirl.create(:register)
      newest_register = FactoryGirl.create(:register)

      Register.by_created_at.should == [oldest_register, newest_register]
    end
  end
end
