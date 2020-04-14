class UsersBooks::CreateService < BaseService
  attr_accessor :user
  attr_accessor :book
  attr_accessor :date_read

  attr_accessor :users_book

  validates :user, presence: true
  validates :book, presence: true

  def call_after_validation
    create_users_book

    valid?
  end

  def create_users_book
    @users_book = UsersBook.create(user: @user, book: @book)
    @users_book.update(date_read: DateTime.now) if @date_read
  end

  def valid?
    return false unless super

    clone_errors(@users_book)

    @errors.empty?
  end
end
