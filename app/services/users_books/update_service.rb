class UsersBooks::UpdateService < BaseService
  attr_accessor :date_read
  attr_accessor :reading_status

  attr_accessor :users_book

  validates :users_book, presence: true

  def call_after_validation
    update_users_book

    valid?
  end

  def update_users_book
    if @date_read
      @users_book.read!
      @users_book.update(date_read: @date_read.to_date)
    elsif @reading_status.present?
      @reading_status.positive? ? @users_book.read! : @users_book.unread!
    end
  end

  def valid?
    return false unless super

    clone_errors(@users_book)

    @errors.empty?
  end
end
