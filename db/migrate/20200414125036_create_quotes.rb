class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.text :quote_text
      t.integer :page_num
      t.string :type
      t.references :user, null: false, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
