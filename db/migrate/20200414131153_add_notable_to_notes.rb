class AddNotableToNotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :notes, :notable, polymorphic: true, null: false
  end
end
