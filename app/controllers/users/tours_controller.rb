class Users::ToursController < ApplicationController
  load_resource :user

  def index
    load_tours
  end

  private

  def load_tours
    tours_query = params[:show_passed].nil? ? tour_scope.switched_on : tour_scope
    @tours_owned = tours_query.owned_by([@user]).to_a
    @tours_participate = tours_query.involved_as_participant(@user).to_a
  end

  def tour_scope
    Tour.published.involved(@user)
  end
end
