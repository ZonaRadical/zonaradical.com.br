module OffersHelper
  def offer_participation_status(offer, options = {})
    participate_button = options[:participate_button] || false

    if offer.user_participants.include?(current_user)
      if offer.participants.where(user: current_user).first.approved?
        fa_icon('check-circle', text: t('youAreIn'), class: 'green')
      elsif offer.participants.where(user: current_user).first.refused?
        fa_icon('times-circle', text: t('participationRefused'), class: 'red')
      else
        fa_icon('question-circle', text: t('participationRequestSent'), class: 'yellow')
      end
    elsif participate_button
      form_for [offer, Offer::Participant.new] do |f|
        concat(f.hidden_field :offer_id, value: offer.id)
        concat(f.hidden_field :user_id, value: current_user.id)
        concat(f.submit t('participate'))
      end if current_user and not offer.user_owners.include?(current_user)
    end
  end

  def offer_resort_categories
    Offer.published.collect(&:resort_categories).flatten.uniq.reject { |item| item.blank? }
  end

  def offer_dates
    Offer.published.collect { |t| Date.new(t.check_in_y, t.check_in_m) }.uniq.sort
  end

  def offer_styles
    Offer.published.collect(&:tour_style).uniq
  end

  def offer_accommodations
    Offer.published.collect(&:accommodation).uniq.reject { |item| item.blank? }
  end

  def offer_resorts
    Offer.published.collect(&:resorts).flatten.uniq.reject { |item| item.blank? }
  end

  def check_in_formatted(offer)
    if offer.check_in_d.nil?
      offer.check_in.strftime('%m/%Y')
    else
      offer.check_in.strftime('%d/%m/%Y')
    end
  end

  def offer_countries(offer)
    offer.resort_categories.collect(&:name).join(', ')
  end

  def offer_resorts_names(offer)
    offer.resorts.collect(&:name).join(', ')
  end

  def offer_resorts_names_linked(offer)
    offer.resorts.collect do |resort|
      link_to resort.name, show_resort_path(resort.resort_category, resort), target: '_blank'
    end.join(', ').html_safe
  end
end
