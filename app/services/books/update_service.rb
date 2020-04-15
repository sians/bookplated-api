class Books::UpdateService < BaseService
  attr_accessor :title
  attr_accessor :first_published
  attr_accessor :isbn
  attr_accessor :pages

  attr_accessor :book

  validates :book, presence: true

  def call_after_validation
    update_book

    valid?
  end

  def update_book
    @book.update(
      title: @title,
      first_published: @first_published,
      isbn: @isbn,
      pages: @pages
      )
  end

  def valid?
    return false unless super

    clone_errors(@book)

    @errors.empty?
  end
end
