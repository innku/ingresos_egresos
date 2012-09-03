require "spec_helper"

describe RegistersController do
  let!(:current_month_register) { FactoryGirl.create(:register, :date => Date.parse("2012-07-01")) }
  let!(:previous_month_register) { FactoryGirl.create(:register, :date => Date.parse("2012-06-01")) }

  before do
    Timecop.freeze(Time.new(2012,07,01)) 
  end

  after do
    Timecop.return
  end

  describe 'GET index' do

    it 'renders all the registers of the current month' do
      get :index
      assigns(:registers).should == [current_month_register]
    end

    it 'renders the registers of the month set by the param start' do
      get :index, start: '2012-06-01'
      assigns(:registers).should == [previous_month_register]
    end

  end  

  describe 'GET search' do
    it 'renders the registers of the months set by the start and end date specified in the params' do
      get :search, start: '2012-07-01', finish: '2012-08-25'
      assigns(:registers).should == [current_month_register]
    end
  end
end