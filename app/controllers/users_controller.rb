class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :finish_signup

  def index
    @users = User.all
  end

  def finish_signup
    if request.patch? && params[:user] #&& params[:user][:email]
      if params[:id].to_i == current_user.id
        if current_user.update(user_params)
          current_user.skip_reconfirmation!
          sign_in(current_user, :bypass => true)
          redirect_to current_user, notice: 'Your profile was successfully updated.'
        else
          @show_errors = true
        end
      else
        editedUser = User.find(params[:id])
        if editedUser.update(user_params)
          editedUser.skip_reconfirmation!
          flash[:notice] = 'Profile was successfully updated.'
          redirect_to edit_user_path editedUser
        else
          @show_errors = true
        end
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

  def profile
    @user = @current_user
    render :show
  end

  def athletes
    @users = User.athletes
  end

  private

  def user_params
    accessible = [ :name, :email, :avatar, :remove_avatar,
                    :sex, :surname, :login, :birthday, :country,
                    :city, :web, :fb, :bio, :role_ids => [] ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
