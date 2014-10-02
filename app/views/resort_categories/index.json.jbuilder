json.array!(@resort_categories) do |resort_category|
  json.extract! resort_category, :id, :name, :parent_id, :description
  json.url resort_category_url(resort_category, format: :json)
end
