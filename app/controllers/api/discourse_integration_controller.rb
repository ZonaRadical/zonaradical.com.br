class API::DiscourseIntegrationController < API::BaseController
  before_action :authenticate_discourse

  def top_menu
    render partial: 'layouts/header_discourse'
  end



  private

  def authenticate_discourse
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token{ |token, options| api_key == token }
  end

  def api_key
    Rails.application.secrets.discourse_integration_api_key ||
      raise SecurityError "API key for discourse integration is not provided. Add 'discourse_integration_api_key' entry in your secrets.yml"
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Discourse Integration"'
    render json: 'Bad credentials', status: 401
  end

end