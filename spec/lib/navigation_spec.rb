require 'active_support/all'
require 'Services/navigation'

describe "Navigation" do
  describe "#start_date" do 
    it "returns todays date if start variable is nil" do
      Services::Navigation.new(nil).start_date.should == Date.today
    end

    it "sets the start date to the desired date" do
      Services::Navigation.new("2012-11-04").start_date.should == Date.parse("2012-11-04")
    end

    it "returns todays date when start variable could not be parsed" do
      Services::Navigation.new("sdsa").start_date.should == Date.today      
    end
  end

  describe "#previous_month" do 
    it "returns the month before the start date" do
      Services::Navigation.new("2012-11-04").previous_month.should == Date.parse("2012-10-01")
    end
  end

  describe "#next_month" do   
    it "returns the month after the start date" do
      Services::Navigation.new("2012-11-04").next_month.should == Date.parse("2012-12-01")
    end
  end

  describe "#finish_date" do
    it "sets the finish date to the end month of the start date if no finish date is present" do
      Services::Navigation.new("2012-11-04").finish_date.should == Date.parse("2012-11-30")
    end

    it "sets the finish date to the desired date" do
      Services::Navigation.new("2012-11-04", "2012-12-04").finish_date.should == Date.parse("2012-12-04")
    end

    it "returns the finish date to the end month when finish variable could not be parsed" do
      Services::Navigation.new("2012-11-04", "sdsa").finish_date.should == Date.parse("2012-11-30")      
    end
  end
end