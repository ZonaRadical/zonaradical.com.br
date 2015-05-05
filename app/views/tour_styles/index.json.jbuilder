json.array!(@tour_styles) do |tour_style|
  json.extract! tour_style, :id, :name, :description
  json.url tour_style_url(tour_style, format: :json)
end
