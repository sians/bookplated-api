class UsersAuthors::CreateService < BaseService
  attr_accessor :user
  attr_accessor :author
  attr_accessor :biography

  attr_accessor :users_author

  validates :user, presence: true
  validates :author, presence: true

  def call_after_validation
    create_users_author

    valid?
  end

  def create_users_author
    @users_author = UsersAuthor.create(
      user: @user,
      author: @author,
      biography: @biography)
  end

  def valid?
    return false unless super

    clone_errors(@users_author)

    @errors.empty?
  end
end
