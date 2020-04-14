class Api::UsersBooksController < Api::BaseController
  before_action :set_users_book, only: [:show, :update]

  def index
    @books = UsersBook.includes(:book).where(user: current_user)

    json_response(
      @books,
      include_data: [:book]
    )
  end

  def show
    json_response(
      @users_book,
      include_data: [:book, :quotes, :notes]
    )
  end

  def create
    @book = Book.find(create_params[:book_id])

    service = UsersBooks::CreateService.new(
      user: current_user,
      book: @book,
      date_read: create_params[:date_read]
    )

    if service.call
      json_response(
        service.users_book,
        include_data: [:book, :quotes, :notes],
      )
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    service_params = update_params.merge(users_book: @users_book)
    service = UsersBooks::UpdateService.new(service_params)

    if service.call
      json_response(
        service.users_book,
        include_data: [:book, :quotes, :notes],
      )
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def set_users_book
    @users_book = UsersBook.find(params[:id])
  end

  def create_params
    params.require(:users_book).permit(
      :book_id,
      :date_read
      )
  end

  def update_params
    params.require(:users_book).permit(
      :date_read,
      :reading_status
      )
  end
end
