class UsersAuthorSerializer < BaseSerializer
  attribute :id
  attribute :biography

  belongs_to :author
end
