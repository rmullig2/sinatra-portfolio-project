require 'spec_helper'

describe UserController do
  
  describe "Signup Page" do
    
    it 'loads the signup page' do
      get '/signup'
      expect(last_response.status).to eq(200)
    end
    
    it 'successful signup puts user on the main page' do
      params = {
        :first_name => "Brian",
        :last_name => "Cashman",
        :user_name => "bcashman",
        :password => "GoYankees"
      }
      post '/signup', params
      expect(last_response.location).to include("/")
    end
    
    it 'does not create a user without a first name' do
      params = {
        :first_name => "",
        :last_name => "Preller",
        :user_name => "apreller",
        :password => "PadsGM"
      }
      post '/signup', params
      expect(last_response.location).to include("/signup")
    end
    
    it 'does not create a user without a last name' do
      params = {
        :first_name => "A.J.",
        :last_name => "",
        :user_name => "apreller",
        :password => "PadsGM"
      }
      post '/signup', params
      expect(last_response.location).to include("/signup")
    end   
    
  end
  
end
