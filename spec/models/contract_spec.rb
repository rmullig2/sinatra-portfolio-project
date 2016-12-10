require 'spec_helper'

describe 'Contract' do 
  before do
    Contract.create(:years => 3, :value => 15)
  end

  it 'can create a new contract' do
    expect(Contract.last.years).to eq(3)
    expect(Contract.last.value).to eq(15)
  end
end
