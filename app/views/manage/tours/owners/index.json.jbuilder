json.array!(@tour_owners) do |tour_owner|
  json.extract! tour_owner, :id, :tour_id, :user_id
  json.url tour_owner_url(tour_owner, format: :json)
end
