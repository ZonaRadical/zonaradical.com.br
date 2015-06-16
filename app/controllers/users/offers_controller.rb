class Users::OffersController < ApplicationController
  load_resource :user

  def index
    load_offers
  end

  private

  def load_offers
    offers_query = params[:show_passed].nil? ? tour_scope.switched_on : tour_scope
    @offers_owned = offers_query.owned_by([@user]).to_a
  end

  def tour_scope
    Offer.published.involved(@user)
  end
end
