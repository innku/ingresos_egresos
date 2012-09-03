require "spec_helper"

describe TagsController do
  
  describe 'GET index' do
    it 'renders the names of all the tags' do
      FactoryGirl.create(:tag)
      get :index, format: :json
      JSON.parse(response.body).should == ['compras']
    end
  end  

end