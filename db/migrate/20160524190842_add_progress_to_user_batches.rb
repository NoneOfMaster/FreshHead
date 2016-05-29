class AddProgressToUserBatches < ActiveRecord::Migration
  def change
    add_column :user_batches, :user_progress, :integer, :default => 0
  end
end
