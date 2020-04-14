class Api::BooksController < Api::BaseController
  def index
    @books = Book.all
  end

  def show
  end

  def create
  end

  def update
  end

  private

  def set_book
  end

  def book_params
  end
end
