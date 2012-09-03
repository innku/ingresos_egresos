require "spec_helper"

describe RegistersController do
  
  describe 'GET index' do

    let!(:current_month_register) { FactoryGirl.create(:register, :date => Date.today) }
    let!(:previous_month_register) { FactoryGirl.create(:register, :date => 1.month.ago.to_date) }

    it 'renders all the registers of the current month' do
      get :index, format: :json
      response.body.should == [current_month_register].to_json
    end

    it 'renders the registers of the month set by the param start' do
      get :index, start: '2012-07-01', format: :json
      response.body.should == [previous_month_register].to_json
    end

    it 'renders the registers of the months set by the start and end date specified in the params' do
      get :index, start: '2012-07-01', finish: '2012-09-01', format: :json
      response.body.should == [previous_month_register, current_month_register].to_json
    end
  end  

end