module ToursHelper
  def participate_button(tour)
    form_for [tour, Tour::Participant.new] do |f|
      concat(f.hidden_field :tour_id, value: tour.id)
      concat(f.hidden_field :user_id, value: current_user.id)
      concat(f.submit t('participate'))
    end unless tour.user_owners.include?(current_user)
  end
end