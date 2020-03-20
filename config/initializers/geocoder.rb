Geocoder.configure(
  lookup: :google,
  ip_lookup: :ipinfo_io,
  api_key: ENV['GOOGLE_MAPS_API_KEY']
)
