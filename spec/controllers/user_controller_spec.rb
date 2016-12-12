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
    
    it 'successful signup creates a new user in database' do
      params = {
        :first_name => "Brian",
        :last_name => "Cashman",
        :user_name => "bcashman",
        :password => "GoYankees"
      }
      post '/signup', params
      expect(User.last.user_name).to eq("bcashman")
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

    it 'does not create a user without a user name' do
      params = {
        :first_name => "A.J.",
        :last_name => "Preller",
        :user_name => "",
        :password => "PadsGM"
      }
      post '/signup', params
      expect(last_response.location).to include("/signup")
    end
    
    it 'does not create a user if the user name exists' do
      User.create(:first_name => "Brian", :last_name => "Cashman",
                  :user_name => "bcashman", :password => "GoYankees")
      params = {
        :first_name => "A.J.",
        :last_name => "Preller",
        :user_name => "bcashman",
        :password => "PadsGM"
      }
      post '/signup', params
      expect(last_response.location).to include("/signup")
    end

    it 'does not create a user without a password' do
      params = {
        :first_name => "A.J.",
        :last_name => "Preller",
        :user_name => "apreller",
        :password => ""
      }
      post '/signup', params
      expect(last_response.location).to include("/signup")
    end

  end

  describe "Login Page" do

    it 'loads the login page' do
      get '/login'
      expect(last_response.status).to eq(200)
    end
    
    it 'allows user to login with correct password' do
      User.create(:first_name => "Brian", :last_name => "Cashman",
                  :user_name => "bcashman", :password => "GoYankees")
      visit 'login'
      fill_in(:user_name, :with => "bcashman")
      fill_in(:password, :with => "GoYankees")
      click_button 'Login'
      expect(page.current_path).to include("/users/bcashman")
    end
    
    it 'does not allow user to login without specifying password' do
      User.create(:first_name => "Brian", :last_name => "Cashman",
                  :user_name => "bcashman", :password => "GoYankees")
      visit 'login'
      fill_in(:user_name, :with => "")
      fill_in(:password, :with => "GoYankees")
      click_button 'Login'
      expect(page.current_path).to include("/login")
    end
    
    it 'does not allow user to login with an incorrect password' do
      User.create(:first_name => "Brian", :last_name => "Cashman",
                  :user_name => "bcashman", :password => "GoYankees")
      visit 'login'
      fill_in(:user_name, :with => "bcashman")
      fill_in(:password, :with => "goyankees")
      click_button 'Login'
      expect(page.current_path).to include("/login")
    end

  end

  
end
