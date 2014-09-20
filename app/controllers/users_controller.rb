class UsersController < ApplicationController
  before_action :set_user, :finish_signup
  before_filter :set_last_seen_at, if: proc { |p| user_signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 15.minutes.ago) }

  def finish_signup
    if request.patch? && params[:user] #&& params[:user][:email]
      if current_user.update(user_params)
        current_user.skip_reconfirmation!
        sign_in(current_user, :bypass => true)
        redirect_to current_user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :profile, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [ :name, :email, :avatar, :remove_avatar ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end

  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now)
    session[:last_seen_at] = Time.now
  end
end
