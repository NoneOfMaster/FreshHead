require 'rails_helper'

RSpec.describe UserBatch, type: :model do
  
  before(:all) do
    @batch = Batch.create
    @user = User.create
  end

  it 'adds a batch to a user and vise versa' do
    expect(@user.batches.count).to eq 0
    
    @user.batches << @batch
    expect(@user.batches.first.poem.poet). to eq (@batch.poem.poet)
    expect(@batch.users.first).to eq @user
  end

  after(:all) do
    @batch.destroy
    @user.destroy
  end

end
