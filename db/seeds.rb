30.times do |i|
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph(sentence_count: Faker::Number.between(from: 1, to: 6)),
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end