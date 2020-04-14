class UsersAuthor < ApplicationRecord
  belongs_to :user
  belongs_to :author
  has_many :quotes, as: :quotable
  has_many :notes, as: :notable
end
