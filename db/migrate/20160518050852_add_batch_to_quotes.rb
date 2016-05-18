class AddBatchToQuotes < ActiveRecord::Migration
  def change
    add_reference :quotes, :batch, index: true, foreign_key: true
  end
end
