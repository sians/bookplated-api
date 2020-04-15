class AuthorSerializer < BaseSerializer
  attribute :id
  attribute :first_name
  attribute :last_name
  attribute :birth_year
  attribute :death_year
  attribute :gender
  attribute :born
  attribute :nationality

  has_many :authors_books
end
