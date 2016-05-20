require 'rails_helper'

RSpec.describe Quote, type: :model do
  before(:all) do
    @quote = Quote.create
  end

  it 'has text' do
    expect(@quote.text).to be_a(String)
  end

  it 'has an author' do
    expect(@quote.author).to be_a(String)
    puts @quote.author
  end

  ##figure out the way to get this working right for clean db after all tests
  after(:all) do
    @quote.destroy
  end
end
