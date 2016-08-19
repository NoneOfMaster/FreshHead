class AddCompleteToUserBatches < ActiveRecord::Migration
  def change
    add_column :user_batches, :complete, :boolean
  end
end
