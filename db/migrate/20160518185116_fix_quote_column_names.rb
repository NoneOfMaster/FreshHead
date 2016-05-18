class FixQuoteColumnNames < ActiveRecord::Migration
  def change
    rename_column :quotes, :quote_text, :text
    rename_column :quotes, :quote_author, :author
  end
end
