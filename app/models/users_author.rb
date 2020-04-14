class UsersAuthor < ApplicationRecord
  belongs_to :user
  belongs_to :author
  has_many :quotes, as: :quotable
end
