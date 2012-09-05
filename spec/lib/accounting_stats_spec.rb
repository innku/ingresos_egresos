require 'Services/accounting_stats'

describe "AccountingStats" do

  describe "#incomes_total" do
    it "returns the sum of the incomes amount" do
      income = stub(:income? => true, :amount => 200)
      expense = stub(:income? => false, :amount => 200)

      registers = [income, expense]
      Services::AccountingStats.new(registers).incomes_total.should == 200
    end

    it "returns zero if no incomes exist" do
      expense = stub(:income? => false, :amount => 200)

      registers = [expense]
      Services::AccountingStats.new(registers).incomes_total.should == 0
    end
  end

  describe "#expenses_total" do
    it "returns the sum of the expe amount" do
      income = stub(:income? => true, :amount => 200)
      expense = stub(:income? => false, :amount => 200)

      registers = [income, expense]
      Services::AccountingStats.new(registers).expenses_total.should == 200
    end
  end

  describe "#difference_total" do
    it "returns the diffence between the incomes total and expenses total" do
      income = stub(:income? => true, :amount => 500)
      expense = stub(:income? => false, :amount => 200)

      registers = [income, expense]
      Services::AccountingStats.new(registers).difference_total.should == 300
    end
  end
end