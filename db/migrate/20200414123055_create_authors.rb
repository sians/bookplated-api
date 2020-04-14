class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :birth_year
      t.string :nationality
      t.string :born
      t.integer :death_year
      t.integer :gender

      t.timestamps
    end
  end
end
