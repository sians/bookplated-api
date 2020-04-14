class UsersBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :quotes, as: :quotable
  has_many :notes, as: :notable
end
