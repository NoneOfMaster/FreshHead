class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.text :title
      t.text :poet
      t.text :poem
      t.references :batch, index: true, foreign_key: true
    end
  end
end
