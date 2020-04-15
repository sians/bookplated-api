class Api::UsersAuthorsController < Api::BaseController
  before_action :set_users_author, only: [:show, :update]

  def index
    @users_authors = UsersAuthor.includes(:author).where(user: current_user)

    json_response(
      @users_authors,
      include_data: [:author]
    )
  end

  def show
    json_response(
      @users_author,
      include_data: [:author]
    )
  end

  def create
    @author = Author.find(create_params[:author_id])

    service = UsersAuthors::CreateService.new(
      user: current_user,
      author: @author,
      biography: create_params[:biography]
    )

    if service.call
      json_response(
        service.users_author,
        include_data: [:author]
      )
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  def update
    service_params = update_params.merge(users_author: @users_author)
    service = UsersAuthors::UpdateService.new(service_params)

    if service.call
      json_response(
        service.users_author,
        include_data: [:author]
      )
    else
      render_unprocessable_entity!(service.errors)
    end
  end

  private

  def set_users_author
    @users_author = UsersAuthor.find(params[:id])
  end

  def create_params
    params.require(:users_author).permit(
      :author_id,
      :biography
    )
  end

  def update_params
    params.require(:users_author).permit(
      :biography
    )
  end
end
