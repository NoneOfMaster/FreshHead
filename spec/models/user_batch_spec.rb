require 'rails_helper'

RSpec.describe UserBatch, type: :model do
  
  before(:all) do
    @batch = Batch.create({id:1})
    @user = User.create({id: 1, user_name: "test", email: "test", password: "test", password_digest: "test"})
  end

  it 'adds a batch to a user and vise versa' do
    expect(@user.batches.count).to eq 0

    @user.batches << @batch

    @batch.reload
    expect(@user.batches.first.poem.poet). to eq (@batch.poem.poet)
    expect(@batch.users.first).to eq @user
  end

  after(:all) do
    @batch.destroy
    @user.destroy
  end

end
