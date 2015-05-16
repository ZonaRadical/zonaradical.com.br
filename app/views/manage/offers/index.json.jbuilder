json.array!(@offers) do |offer|
  json.extract! offer, :id, :tour_style_id, :accomadation_id, :title, :description, :whats_included, :duration, :check_in, :switch_off, :img, :price, :published
  json.url offer_url(offer, format: :json)
end
