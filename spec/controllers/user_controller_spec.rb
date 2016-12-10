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
      expect(last_response.location).to include("/main")
    end
    
  end
  
end
