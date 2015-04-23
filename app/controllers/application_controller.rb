class ApplicationController < ActionController::Base
  before_filter :set_last_seen_at, if: proc { |p| user_signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 15.minutes.ago) }

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  def access_denied(exception)
    redirect_to root_url, :alert => exception.message
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now)
    session[:last_seen_at] = Time.now
  end
end
