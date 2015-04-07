json.array!(@tours) do |tour|
  json.extract! tour, :id, :tour_style_id, :accomadation_id, :title, :description, :whats_included, :duration, :check_in, :switch_off, :img, :price, :published
  json.url tour_url(tour, format: :json)
end
