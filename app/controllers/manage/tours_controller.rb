class Manage::ToursController < ApplicationController
  include Gallerable
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    load_tours
  end

  def new
    build_tour
  end

  def edit
    load_tour
    build_tour
  end

  def create
    build_tour
    @tour.owners.build(user: current_user)
    save_tour or (render 'new' and return)
    create_gallery_images(@tour)
  end

  def update
    load_tour
    build_tour
    update_gallery_images(@tour)
    save_tour or render 'edit'
  end

  def destroy
    load_tour
    @tour.destroy
    redirect_to manage_tours_path
  end

  private
    def load_tours
      tours_query = params[:show_passed].nil? ? tour_scope.switched_on : tour_scope
      @tours ||= tours_query.paginate(page: params[:page]).to_a
    end

    def load_tour
      @tour ||= tour_scope.find(params[:id])
    end

    def build_tour
      @tour ||= tour_scope.build
      @tour.attributes = tour_params
    end

    def save_tour
      redirect_to [:manage, @tour], notice: 'Tour was successfully created.' if @tour.save
    end

    def tour_params
      permitted_params = [:tour_style_id, :accommodation_id, :title,
        :description, :duration, :check_in_d, :check_in_m, :check_in_y,
        :switch_off, :img, :price, resort_category_ids: [], resort_ids: []]
      permitted_params << :published if current_user.admin?
      tour_params = params[:tour]
      tour_params ? tour_params.permit(permitted_params) : {}
    end

    def tour_scope
      current_user.admin? ? Tour.all : Tour.involved(current_user)
    end
end
