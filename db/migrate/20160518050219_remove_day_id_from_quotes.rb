class RemoveDayIdFromQuotes < ActiveRecord::Migration
  def change
    remove_reference :quotes, :day, index: true, foreign_key: true
  end
end
