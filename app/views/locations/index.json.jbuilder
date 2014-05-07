json.array!(@locations) do |location|
  json.extract! location, :id, :address, :street_name, :block_number, :postal_code, :latitude, :longitude
  json.url location_url(location, format: :json)
end
