require 'spec_helper'

describe "Register" do
  describe "validations" do
    let(:register) { Register.new(name: "Nuevo concepto", folio: "123", date: Date.today, kind: "ingreso", amount: 200) }

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
end
