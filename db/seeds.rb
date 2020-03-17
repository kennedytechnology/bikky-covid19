require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurants.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Restaurant.new
  t.name = row['name']
  t.location = row['location']
  t.address = row['address']
  t.url = row['url']
  t.description = Faker::Lorem.paragraph(sentence_count: Faker::Number.between(from: 1, to: 6))
  t.save
end

Restaurant.all.each do |restaurant|
  restaurant.photo.attach(
    io: File.open(Rails.root.join("app", "assets", "images", "restaurants_photos", "amma.jpeg")),
    filename: "amma.jpeg",
    content_type: "image/jpeg")
end

puts "Done"
