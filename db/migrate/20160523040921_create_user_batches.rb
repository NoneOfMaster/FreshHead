class CreateUserBatches < ActiveRecord::Migration
  def change
    create_table :user_batches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :batch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
