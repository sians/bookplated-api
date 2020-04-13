class Api::SessionsController < Devise::SessionsController
  def create
    super { |resource| @resource = resource }
  end
end
