class Author < ApplicationRecord
  has_many :authors_books
  has_many :users_authors
  has_many :books, through: :authors_books
end
