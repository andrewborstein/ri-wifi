json.array!(@spots) do |spot|
  json.extract! spot, :id, :name, :id, :pw, :pw_open, :pw_login, :dl, :ul, :address, :latitude, :longitude, :website, :yelp, :facebook
  json.url spot_url(spot, format: :json)
end
