class Quote < ApplicationRecord
  belongs_to :user
  belongs_to :author, optional: true
  belongs_to :quotable, polymorphic: true
end
