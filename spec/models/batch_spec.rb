require 'rails_helper'

RSpec.describe Batch, type: :model do 
  before(:all) do
    @batch = Batch.create
  end

  describe '#set_batch_data' do

    it 'has a poem object' do
      expect(@batch.poem).to be_an_instance_of(Poem)
    end

    describe "batch's poem" do

      it 'has a poem object with a poem' do
        expect(@batch.poem.poem).to be_a(String)
      end

      it 'has a poem object with a title' do
        expect(@batch.poem.title).to be_a(String)
      end

      it 'has a poem object with a poet' do
        expect(@batch.poem.poet).to be_a(String)
      end

    end

    it 'has a quote object' do
      expect(@batch.quote).to be_an_instance_of(Quote)
    end

    describe "batch's quote" do

      it 'has a quote object with quote text' do
        expect(@batch.quote.text).to be_a(String)
      end

      it 'has a quote object with a quote author' do
        expect(@batch.quote.author).to be_a(String)
      end
    end 

    it 'has a fact object' do
      expect(@batch.fact).to be_an_instance_of(Fact)
    end

    describe "batch's fact" do
      it 'has a fact object with fact text' do
        expect(@batch.fact.text).to be_a(String)
      end
    end 
  end

  describe '#cli_details' do
    it "prints a batch's details to the CLI" do
        expect(@batch.cli_details).to be(true)
    end
  end

  context "when a batch is destroyed" do
    before(:all) do
      @batch.destroy
    end

    it "destroys all objects " do
      ##rewrite this test where before destruction the values get stored as
      ##instances and then searched in db
      ##this way the test doens't break if the db isn't cleaned each time

      ##or consider clearing the db at the top of the doc

      ##of figure out database_cleaner 

      ##figure out how to do this right
      expect(Poem.all.count).to eq(0)
      expect(Quote.all.count).to eq(0)
      expect(Fact.all.count).to eq(0)
    end
  end

end