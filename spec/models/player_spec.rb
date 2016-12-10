require 'spec_helper'

describe 'Player' do 
  before do
    Player.create(:name => "Gary Sanchez")
  end

  it 'can create a new player' do
    expect(Player.last.name).to eq("Gary Sanchez")
  end
end
