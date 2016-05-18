class AddDayToQuotes < ActiveRecord::Migration
  def change
    add_reference :quotes, :day, index: true, foreign_key: true
  end
end
