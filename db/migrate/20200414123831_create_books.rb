class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :first_published
      t.string :isbn
      t.integer :pages

      t.timestamps
    end
  end
end
