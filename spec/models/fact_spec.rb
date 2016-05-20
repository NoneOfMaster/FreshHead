require 'rails_helper'

RSpec.describe Fact, type: :model do
  before(:all) do
    @fact = Fact.create
  end

  it 'has text' do
    expect(@fact.text).to be_a(String)
    puts @fact.text
  end

  after(:all) do
    @fact.destroy
  end
end
