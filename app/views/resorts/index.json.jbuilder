json.array!(@resorts) do |resort|
  json.extract! resort, :id, :name, :image, :country_id, :link, :link_to_map, :level1_description, :level2_description, :level3_description
  json.url resort_url(resort, format: :json)
end
