class ApplicationController < ActionController::API
  include pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def json_response(data, include_data: [], meta: {}, params: {}, status: :ok)
    options = {
      include: include_data,
      params: params,
      meta: meta
    }

    render(json: json_serializer(data).new(data, options), status: status)
  end

  def user_not_authorized(exception)
    json_response(
      nil,
      status: :unauthorized,
      meta: {
        status: 'KO',
        message: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
      },
    )
  end

  private

  def json_serializer(data)
    return EmptySerializer if data.nil?

    data_class_name = data.is_a?(Enumerable) ? data.klass.name : data.class.name

    "#{data_class_name}Serializer".constantize
  end
end
