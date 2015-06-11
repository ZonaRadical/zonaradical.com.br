class DiscourseController < ApplicationController
  def sso
      sso = DiscourseApi::SingleSignOn.parse(request.query_string, Rails.application.secrets.discourse_secret)
      if current_user.nil?
        store_location_for(:user, '/discourse/after_sign_in/')
        session[:discourse_qs] = request.query_string
        redirect_to '/users/sign_in'
      else
        sso.email = current_user.email
        sso.name = current_user.name
        sso.username = current_user.surname
        sso.external_id = current_user.id
        sso.sso_secret = Rails.application.secrets.discourse_secret
        redirect_to sso.to_url(Rails.application.secrets.discourse_url + '/session/sso_login')
      end
  end
  def after_sign_in
    sso = DiscourseApi::SingleSignOn.parse(session[:discourse_qs], Rails.application.secrets.discourse_secret)
    session[:discourse_qs] = nil
    sso.email = current_user.email
    sso.name = current_user.name
    sso.username = current_user.surname
    sso.external_id = current_user.id
    sso.sso_secret = Rails.application.secrets.discourse_secret
    redirect_to sso.to_url(Rails.application.secrets.discourse_url + '/session/sso_login')
  end

  def logout
    sign_out
    redirect_to root_url(subdomain: 'forum')
  end
end