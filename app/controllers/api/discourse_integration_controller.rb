require 'digest/sha2'

class API::DiscourseIntegrationController < API::BaseController
  before_action :authenticate_discourse

  def top_menu
    @top_menu = TopMenu.fetch

    render json: @top_menu.to_json
  end



  private

  def authenticate_discourse
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      Digest::SHA2.new(256).digest(api_key) == token
    end
  end

  def api_key
    if !Rails.application.secrets.key?(:discourse_integration_api_key)
      raise SecurityError, "API key for discourse integration is not provided. Add 'discourse_integration_api_key' entry in your secrets.yml"
    end
    Rails.application.secrets.discourse_integration_api_key
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Discourse Integration"'
    render json: 'Bad credentials', status: 401
  end

end