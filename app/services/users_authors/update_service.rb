class UsersAuthors::UpdateService < BaseService
  attr_accessor :biography

  attr_accessor :users_author

  validates :users_author, presence: true

  def call_after_validation
    update_users_author

    valid?
  end

  def update_users_author
    @users_author.update(biography: @biography)
  end

  def valid?
    return false unless super

    clone_errors(@users_author)

    @errors.empty?
  end
end
