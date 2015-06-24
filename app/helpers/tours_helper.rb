module ToursHelper
  def participation_status(tour, options = {})
    participate_button = options[:participate_button] || false

    if tour.user_participants.include?(current_user)
      if tour.participants.where(user: current_user).first.approved?
        fa_icon('check-circle', text: t('youAreIn'), class: 'green')
      elsif tour.participants.where(user: current_user).first.refused?
        fa_icon('times-circle', text: t('participationRefused'), class: 'red')
      else
        fa_icon('question-circle', text: t('participationRequestSent'), class: 'yellow')
      end
    elsif participate_button
      form_for [tour, Tour::Participant.new] do |f|
        concat(f.hidden_field :tour_id, value: tour.id)
        concat(f.hidden_field :user_id, value: current_user.id)
        concat(f.submit t('participate'))
      end if current_user and not tour.user_owners.include?(current_user)
    end
  end

  def tour_resort_categories
    Tour.published.collect(&:resort_categories).flatten.uniq.reject { |item| item.blank? }
  end

  def tour_dates
    Tour.published.collect { |t| Date.new(t.check_in_y, t.check_in_m) }.uniq.sort
  end

  def tour_styles
    Tour.published.collect(&:tour_style).uniq
  end

  def tour_accommodations
    Tour.published.collect(&:accommodation).uniq.reject { |item| item.blank? }
  end

  def tour_resorts
    Tour.published.collect(&:resorts).flatten.uniq.reject { |item| item.blank? }
  end

  def search_value_for(symbol)
    params[:search].try(:[], symbol)
  end

  def check_in_formatted(tour)
    if tour.check_in_d.nil?
      tour.check_in.strftime('%m/%Y')
    else
      tour.check_in.strftime('%d/%m/%Y')
    end
  end

  def tour_countries(tour)
    tour.resort_categories.collect(&:name).join(', ')
  end

  def tour_resorts_names(tour)
    tour.resorts.collect(&:name).join(', ')
  end

  def tour_resorts_names_linked(tour)
    tour.resorts.collect do |resort|
      link_to resort.name, show_resort_path(resort.resort_category, resort), target: '_blank'
    end.join(', ').html_safe
  end

  def tour_logo_img(tour)
	if !tour.resorts.first.nil?
		image_tag(tour.resorts.first.image_url(:thumb).to_s, class: "tourlogo", alt: tour.title+" logo")
	else
		image_tag("thumb_default_tour.jpg", class: "tourlogo")
	end
  end

  def tour_day(tour)
    tour.check_in_d.nil? ? 1 : tour.check_in_d
  end

  def tour_month(tour)
    if tour.check_in_m.nil?
      overflow_month?(tour) ? 1 : Time.now.month + 1
    else
      tour.check_in_m
    end
  end

  def tour_year(tour)
    if tour.check_in_y.nil?
      overflow_year?(tour) ? Time.now.year + 1 : Time.now.year
    else
      tour.check_in_y
    end
  end

  private

  def overflow_month?(tour)
    # only overflow, if the value was not selected by the user
    if tour.check_in_m.nil?
      (Time.now.month + 1) % 13 == 0 ? true : false
    else
      false
    end
  end

  def overflow_year?(tour)
    # only overflow, if the value was not selected by the user
    if tour.check_in_y.nil?
      overflow_month?(tour)
    else
      false
    end
  end

  def country_or_resort(tour)
    tour.resorts.first || tour.countries.first.resort_category
  end
end
