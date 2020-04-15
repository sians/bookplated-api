class Api::BooksController < Api::BaseController
  before_action :set_book, only: [:update]
  def index
    @books = Book.all

    json_response(
      @books,
      include_data: [:authors]
    )
  end

  def create
    authors = create_params[:author_ids].map {|id| Author.find(id)}
    service_params = create_params.merge(authors: authors)

    service = Books::CreateService.new(service_params)

    if service.call
      json_response(
        service.book,
        include_data: [:authors]
      )
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    service_params = update_params.merge(book: @book)
    service = Books::UpdateService.new(service_params)

    if service.call
      json_response(
        service.book,
        include_data: [:authors]
      )
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def create_params
    params.require(:book).permit(
      :title,
      :first_published,
      :isbn,
      :pages,
      :author_ids => []
    )
  end

  def update_params
    params.require(:book).permit(
      :title,
      :first_published,
      :isbn,
      :pages
    )
  end
end
