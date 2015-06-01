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

  def offers
    load_offers
  end

  def comment
    load_tour
    build_comment
    save_comment or render 'show'
  end

  private

  def load_tours
    @tours ||= tour_scope.switched_on.paginate(page: params[:page]).to_a
  end

  def load_offers
    @tours ||= tour_scope.owned_by(User.agencies).paginate(page: params[:page])
      .to_a
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

    @tours ||= tour_scope.filter(filter_options).paginate(page: params[:page]).to_a
  end

  def search_params
    params.require(:search).permit(:resort_categories, :period, :tour_style,
      :accommodation, :cost, :age_group, :resorts, :show_passed)
  end

  def tour_scope
    Tour.published.order(:check_in)
  end

  def build_comment
    @comment ||= Comment.new
    @comment.tour_id = @tour.id
    @comment.user_id = current_user.id
    @comment.content = comment_params[:content]
  end

  def save_comment
    redirect_to @tour if @comment.save
  end

  def comment_params
    comment_params = params[:comment]
    comment_params ? comment_params.permit(:content) : {}
  end
end