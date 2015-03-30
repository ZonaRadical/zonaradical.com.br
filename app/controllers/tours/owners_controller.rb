class Tours::OwnersController < ApplicationController
  load_and_authorize_resource :tour, through: :current_user
  load_and_authorize_resource :owner, through: :tour, class: Tour::Owner

  def index
    load_owners
  end

  def show
    load_owner
  end

  def new
    build_owner
  end

  def edit
    load_owner
    build_owner
  end

  def create
    build_owner
    save_owner or render 'new'
  end

  def update
    load_owner
    build_owner
    save_owner or render 'edit'
  end

  def destroy
    load_owner
    @owner.destroy
    redirect_to tour_owners_url
  end

  private

  def load_owners
    @owners ||= owner_scope.to_a
  end

  def load_owner
    @owner ||= owner_scope.find(params[:id])
  end

  def build_owner
    @owner ||= owner_scope.build
    @owner.attributes = owner_params
  end

  def save_owner
    redirect_to [@tour, @owner] if @owner.save
  end

  def owner_params
    owner_params = params[:owner]
    owner_params ? owner_params.permit(:tour_id, :user_id) : {}
  end

  def owner_scope
    @tour.owners
  end
end
