class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :title
      t.text :abstract
      t.text :url
      t.references :batch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
