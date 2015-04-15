module ToursHelper
  def participation_status(tour)
    if tour.user_participants.include?(current_user)
      if tour.participants.where(user: current_user).first.approved?
        content_tag(:p, t('youAreIn'), class: 'green')
      elsif tour.participants.where(user: current_user).first.refused?
        content_tag(:p, t('participationRefused'))
      else
        content_tag(:p, t('participateRequestSent'))
      end
    else
      form_for [tour, Tour::Participant.new] do |f|
        concat(f.hidden_field :tour_id, value: tour.id)
        concat(f.hidden_field :user_id, value: current_user.id)
        concat(f.submit t('participate'))
      end if current_user and not tour.user_owners.include?(current_user)
    end
  end
end