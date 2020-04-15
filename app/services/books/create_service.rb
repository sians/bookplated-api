class Books::CreateService < BaseService
  attr_accessor :title
  attr_accessor :first_published
  attr_accessor :isbn
  attr_accessor :pages
  attr_accessor :authors
  attr_accessor :author_ids

  attr_accessor :book

  validates :title, presence: true
  validates :authors, presence: true

  def call_after_validation
    create_book

    valid?
  end

  def create_book
    @book = Book.create(
      title: @title,
      first_published: @first_published,
      isbn: @isbn,
      pages: @pages
      )

    @authors.each { |author| @book.authors << author }
  end

  def valid?
    return false unless super

    clone_errors(@book)

    @errors.empty?
  end
end
