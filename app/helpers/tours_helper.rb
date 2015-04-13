module ToursHelper
  def participate_button(tour)
    form_for [tour, Tour::Participant.new] do |f|
      f.hidden_field :tour_id, value: tour.id
      f.hidden_field :user_id, value: current_user.id
      f.submit t('participate')
    end unless tour.user_owners.include?(current_user)
  end
end