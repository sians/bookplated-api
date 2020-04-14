class UsersBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_many :quotes, as: :quotable
  has_many :notes, as: :notable

  enum reading_status: {unread: 0, read: 1}
end
