class RenameDaysToBatches < ActiveRecord::Migration
  def change
    rename_table :days, :batches
  end
end

