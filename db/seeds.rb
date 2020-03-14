20.times do |i|
  Restaurant.create!(
    name: "Restaurant #{i}",
    location: "Address for restaurant #{i}"
  )
end