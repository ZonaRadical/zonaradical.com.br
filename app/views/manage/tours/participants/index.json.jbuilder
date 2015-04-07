json.array!(@tour_participants) do |tour_participant|
  json.extract! tour_participant, :id, :tour_id, :user_id
  json.url tour_participant_url(tour_participant, format: :json)
end
