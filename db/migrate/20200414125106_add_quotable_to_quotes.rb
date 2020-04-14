class AddQuotableToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :quotes, :quotable, polymorphic: true, null: false
  end
end
