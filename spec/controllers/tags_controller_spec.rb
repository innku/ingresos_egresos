require "spec_helper"

describe TagsController do
  
  describe 'GET index' do
    it 'renders the names of all the tags' do
      FactoryGirl.create(:tag)
      get :index, format: :json
      JSON.parse(response.body).should == ['compras']
    end

    it 'renders the names of the filtered tags' do
      FactoryGirl.create(:tag)
      FactoryGirl.create(:tag, :name => 'papeleria')
      FactoryGirl.create(:tag, :name => 'lapices')
      FactoryGirl.create(:tag, :name => 'paletas')
      FactoryGirl.create(:tag, :name => 'hojas')
      get :index, term: 'pa', format: :json
      JSON.parse(response.body).should == ['papeleria', 'paletas']
    end
  end  

end