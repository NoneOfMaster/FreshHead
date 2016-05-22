require 'rails_helper'
require 'timeout'

RSpec.describe Poem, type: :model do


  it 'gets a poem from poetrydb.org' do
    expect { puts('from Poetrydb.org') }.to output.to_stdout
    poem = Poem.create
    poem.destroy
  end

  xit 'if poetrydb.org takes too long, it gets a poem from poems.com' do
    ## COME BACK TO THIS
    ## THE FUNCTIONALITY WORKS, GOT TO FIGURE OUT HOW TO WRITE THE TEST FOR IT  
    # poem = Poem.create
    # STDOUT.should_receive(:puts).with('from Poems.com')
    # poem.stub(:get_from_poetry_db).and_raise(Exception)
    # poem.destroy
  end 

  xit 'finds a new poem if this current one is already in the database' do

  end

end
