class ToursController < ApplicationController
  def index
    load_tours
  end

  def show
    load_tour
  end

  private

  def load_tours
    @tours ||= tour_scope.order(created_at: :desc).to_a
  end

  def load_tour
    @tour ||= tour_scope.find(params[:id])
  end

  def tour_scope
    Tour.published
  end
end