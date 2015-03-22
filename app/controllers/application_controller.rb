class ApplicationController < ActionController::Base
  before_filter :set_last_seen_at, if: proc { |p| user_signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 15.minutes.ago) }

  def forem_user
    current_user
  end
  helper_method :forem_user

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

  def update_gallery_images(model)
    unless params[:gallery_images].nil?
      unless params[:gallery_images][:images].nil?
        params[:gallery_images][:images].each do |i|
          model.gallery_images.create image: i
        end
      end
      unless params[:gallery_images][:description].nil?
        params[:gallery_images][:description].each do |k, d|
          GalleryImage.find(k).update(description: d)
        end
      end
      unless params[:gallery_images][:order].nil?
        params[:gallery_images][:order].each do |k, d|
          GalleryImage.find(k).update(order: d)
        end
      end
      unless params[:gallery_images][:name].nil?
        params[:gallery_images][:name].each do |k, d|
          GalleryImage.find(k).update(name: d)
        end
      end
      unless params[:gallery_images][:url].nil?
        params[:gallery_images][:url].each do |k, d|
          GalleryImage.find(k).update(url: d)
        end
      end

      unless params[:gallery_images][:remove_image].nil?
        params[:gallery_images][:remove_image].each do |k, d|
          GalleryImage.destroy(k)
        end
      end
    end
  end
end
