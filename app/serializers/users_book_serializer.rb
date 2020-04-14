class UsersBookSerializer < BaseSerializer
  attribute :id
  attribute :date_read
  attribute :reading_status

  has_many :quotes
  has_many :notes
  belongs_to :book
end
