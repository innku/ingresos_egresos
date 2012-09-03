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
  
  describe ".by_date" do
    it "orders the registers by date from oldest to newest" do
      oldest_register = FactoryGirl.create(:register)
      newest_register = FactoryGirl.create(:register)

      Register.by_date.should == [oldest_register, newest_register]
    end
  end

  describe ".filter_by_date" do
    let!(:current_month_register) { FactoryGirl.create(:register, :date => Date.today) }
    let!(:previous_month_register) { FactoryGirl.create(:register, :date => 1.month.ago.to_date) }

    it "filters the registers by the start date and finish date given in the params" do
      Register.filter_by_date(1.month.ago.to_date, Date.today) == [current_month_register, previous_month_register]
    end

  end
end

