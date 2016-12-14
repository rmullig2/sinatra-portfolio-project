require 'spec_helper'

describe AdminController do
  
  describe "Login Page" do

    it 'loads the Admin home page' do
      User.create(:first_name => "Super", :last_name => "User",
                  :user_name => "Admin", :password => "password123")
      visit 'login'
      fill_in(:user_name, :with => "Admin")
      fill_in(:password, :with => "password123")
      click_button 'Login'
      expect(page.current_path).to include("/admin/home")
    end
    
    it 'Admin home page has link to users view/delete page' do
      User.create(:first_name => "Super", :last_name => "User",
                  :user_name => "Admin", :password => "password123")
      visit 'login'
      fill_in(:user_name, :with => "Admin")
      fill_in(:password, :with => "password123")
      click_button 'Login'
      expect(page).to have_selector(:link_or_button, 'Click here to view/delete users')
    end

    it 'Admin home page has link to signings page' do
      User.create(:first_name => "Super", :last_name => "User",
                  :user_name => "Admin", :password => "password123")
      visit 'login'
      fill_in(:user_name, :with => "Admin")
      fill_in(:password, :with => "password123")
      click_button 'Login'
      expect(page).to have_selector(:link_or_button, 'Click here to enter free agent signings')
    end

  end
  
  describe 'Create signings' do
    
    it 'Can create a signing' do
      player = Player.create(:name => "Justin Turner", :rank => 4)
      team = Team.create(:name => "Los Angeles Dodgers", :league => "National", :division => "West")
      years = 4
      value = 65.5
      time = DateTime.new(2016, 12, 8, 16, 45)
      Signing.create(:player_id => player.id, :team_id => team.id, :years => years,
                     :value => value, :signing_time => time)
      expect(Signing.last.years).to eq(4)
    end
    
  end
  
  describe 'Opens the standings page' do
    
    it 'Opens a valid web page to view standings' do
      get '/standings'
      expect(last_response.status).to eq(200)
    end
    
  end

end