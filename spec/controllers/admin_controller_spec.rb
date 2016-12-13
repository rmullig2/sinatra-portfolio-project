require 'spec_helper'

describe AdminController do
  
  describe "Login Page" do

    it 'loads the Admin home page' do
      #binding.pry
      User.create(:first_name => "Super", :last_name => "User",
                  :user_name => "Admin", :password => "password123")
      visit 'login'
      fill_in(:user_name, :with => "Admin")
      fill_in(:password, :with => "password123")
      click_button 'Login'
      expect(page.current_path).to include("/admin/home")
    end
    
  end

end