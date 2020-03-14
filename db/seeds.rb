30.times do |i|
  Restaurant.create!(
    name: Faker::Restaurant.name,
    location: Faker::Address.full_address
  )
end