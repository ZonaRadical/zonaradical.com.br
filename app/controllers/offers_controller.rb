class OffersController < ApplicationController
  def index
    load_offers
  end

  def show
    load_offer
  end

  def search
    load_filtered_offers
    render 'index'
  end

  def offers
    load_offers
  end

  private

  def load_offers
    @offers ||= offer_scope.switched_on.paginate(page: params[:page]).to_a
  end

  def load_offer
    @offer ||= offer_scope.find(params[:id])
  end

  def load_filtered_offers
    filter_options = search_params.delete_if { |k,v| v == "" }

    if filter_options['period']
      check_in_m, check_in_y = filter_options['period'].split('/')
      filter_options['check_in_m'] = check_in_m.to_i
      filter_options['check_in_y'] = check_in_y.to_i
      filter_options.delete('period')
    end
    
    if filter_options['cost']
      cost = filter_options['cost']
      cost = Range.new(*cost.split('..').map { |n| BigDecimal(n).to_f })
      filter_options['cost'] = cost
    end
    
    if filter_options['age_group']
      age_group = filter_options['age_group']
      age_group = Range.new(*age_group.split('..').map { |d| Date.parse(d) })
      filter_options['age_group'] = age_group
    end

    @offers ||= offer_scope.filter(filter_options).paginate(page: params[:page]).to_a
  end

  def search_params
    params.require(:search).permit(:resort_categories, :period, :tour_style,
      :accommodation, :cost, :age_group, :resorts, :show_passed)
  end

  def offer_scope
    Offer.published.order(:check_in)
  end
end