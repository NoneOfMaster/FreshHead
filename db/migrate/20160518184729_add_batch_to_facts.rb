class AddBatchToFacts < ActiveRecord::Migration
  def change
    add_reference :facts, :batch, index: true, foreign_key: true
  end
end
