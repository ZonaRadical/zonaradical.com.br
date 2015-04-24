class ToursController < ApplicationController
  def index
    load_tours
  end

  def show
    load_tour
  end

  def search
    load_filtered_tours
    render 'index'
  end

  private

  def load_tours
    @tours ||= tour_scope.to_a
  end

  def load_tour
    @tour ||= tour_scope.find(params[:id])
  end

  def load_filtered_tours
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

    @tours ||= tour_scope.filter(filter_options).to_a
  end

  def search_params
    params.require(:search).permit(:resort_categories, :period, :tour_style,
      :accommodation, :cost, :age_group, :resorts)
  end

  def tour_scope
    Tour.published
  end
end