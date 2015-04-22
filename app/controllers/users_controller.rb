class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :finish_signup, except: [:update_password]

  def index
    @users = User.all.sort_by { |a| [ a.name.to_s.downcase, a.surname.to_s.downcase ] }
    #.paginate(:page => params[:page], :per_page => 15)
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

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to current_user, notice: 'Passowrd was successuflly updated.'
    else
      render "edit"
    end
  end

  def show
  end

  def profile
    @user = @current_user
    render :show
  end

  def athletes
    @users = User.athletes.paginate(:page => params[:page], :per_page => 15)
  end

  def full_sign_out
    discourse_sign_out
    sign_out
    #redirect_to root_path
  end

  private

  def user_params
    accessible = [ :name, :email, :avatar, :remove_avatar, :image, :remove_image,
                    :sex, :surname, :login, :birthday, :country,
                    :city, :web, :fb, :bio, :role_ids => [] ] # extend with your own params
    accessible << [ :current_password, :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end

  def discourse_sign_out
    client = DiscourseApi::Client.new(Rails.application.secrets.discourse_url)
    client.api_key = Rails.application.secrets.discourse_api_key
    client.api_username = Rails.application.secrets.dicsourse_api_username
    user = client.user(current_user.surname.downcase)
    client.log_out(user['id'])
  end
end
