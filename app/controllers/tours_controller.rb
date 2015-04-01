class ToursController < ApplicationController
  load_and_authorize_resource through: :current_user

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
    save_tour or render 'new'
  end

  def update
    load_tour
    build_tour
    save_tour or render 'edit'
  end

  def destroy
    load_tour
    @tour.destroy
    redirect_to tours_path
  end

  private
    def load_tours
      @tours ||= tour_scope.to_a
    end

    def load_tour
      @tour ||= tour_scope.find(params[:id])
    end

    def build_tour
      @tour ||= tour_scope.build
      @tour.attributes = tour_params
      @tour.owners.build(user: current_user) unless @tour.owners.collect { |owner| owner.user }.include?(current_user)
    end

    def save_tour
      redirect_to @tour, notice: 'Tour was successfully created.' if @tour.save
    end

    def tour_params
      tour_params = params[:tour]
      tour_params ? tour_params.permit(
        :tour_style_id, :accomadation_id, :title, :description, :whats_included,
        :duration, :check_in, :switch_off, :img, :price, :published
      ) : {}
    end

    def tour_scope
      current_user.tours
    end
end
