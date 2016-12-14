require 'spec_helper'

describe TeamController do
  
  describe 'Standings Page' do
    
    it 'loads the team standings' do
      get '/team/home'
      expect(last_response.status).to eq(200)
    end
    
    it 'lists each league' do
      visit '/team/home'
      page.should have_content("American")
      page.should have_content("National")
    end
    
    it 'lists each division' do
      visit '/team/home'
      page.should have_content("East")
      page.should have_content("Central")
      page.should have_content("West")
    end
    
  end
  
  describe 'Details Page' do

    it 'loads the team details' do
      get '/team/detail'
      expect(last_response.status).to eq(200)
    end
    
  end
  
end