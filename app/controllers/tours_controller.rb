class ToursController < ApplicationController
  def index
    load_tours
  end

  private

  def load_tours
    @tours ||= tour_scope.order(created_at: :desc).to_a
  end

  def tour_scope
    Tour.published
  end
end