class BookSerializer < BaseSerializer
  attribute :id
  attribute :title
  attribute :first_published
  attribute :isbn
  attribute :pages

  has_many :authors_books
end
