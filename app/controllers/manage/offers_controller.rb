class Manage::OffersController < ApplicationController
  include Gallerable
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    load_offers
  end

  def new
    build_offer
  end

  def edit
    load_offer
    build_offer
  end

  def create
    build_offer
    save_offer or (render 'new' and return)
    create_gallery_images(@offer)
  end

  def update
    load_offer
    build_offer
    update_gallery_images(@offer)
    save_offer or render 'edit'
  end

  def destroy
    load_offer
    @offer.destroy
    redirect_to manage_offers_path
  end

  private
    def load_offers
      offers_query = params[:show_passed].nil? ? offer_scope.switched_on : offer_scope
      @offers_published = offers_query.published.owned_by([current_user]).to_a
      @offers_draft = offers_query.owned_by([current_user]).to_a - @offers_published
    end

    def load_offer
      @offer ||= offer_scope.find(params[:id])
    end

    def build_offer
      @offer ||= offer_scope.build
      @offer.attributes = offer_params
      @offer.owners.build(user: current_user) unless @offer.owners.collect { |owner| owner.user }.include?(current_user)
    end

    def save_offer
      redirect_to [:manage, @offer], notice: 'Offer was successfully created.' if @offer.save
    end

    def offer_params
      permitted_params = [:tour_style_id, :accommodation_id, :title,
        :description, :duration, :check_in_d, :check_in_m, :check_in_y,
        :switch_off, :price, :hotel_name, :air_included, :image, :remove_image,
        resort_category_ids: [], resort_ids: []]
      permitted_params << :published if can? :manage, @offer
      offer_params = params[:offer]
      offer_params ? offer_params.permit(permitted_params) : {}
    end

    def offer_scope
      current_user.admin? ? Offer.all : Offer.involved(current_user)
    end
end
