require 'spec_helper'

describe 'User' do 
  before do
    @user = User.create(:first_name => "John", :last_name => "Smith", :user_name => "jsmith", :password => "password")
  end

  it 'has a secure password' do
    expect(@user.authenticate("dog")).to eq(false)
    expect(@user.authenticate("test")).to eq(@user)
  end
end
