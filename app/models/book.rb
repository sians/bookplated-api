class Book < ApplicationRecord
  has_many :authors_books
  has_many :users_books
end
