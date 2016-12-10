require 'spec_helper'

describe 'Team' do 
  before do
    Team.create(:name => "Baltimore Orioles", :league => "American", :division=> "East")
  end

  it 'can create a new team' do
    expect(Team.last.name).to eq("Baltimore Orioles")
    expect(Team.last.league).to eq("American")
    expect(Team.last.division).to eq("East")
  end
end
