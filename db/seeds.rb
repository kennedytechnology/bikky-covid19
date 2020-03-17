require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'partners.csv'))
CSV.parse(csv_text, headers: true).each do |row|
  row['price'] = row['price'].length
  Partner.create!(row.to_h)
end

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurants.csv'))
# csv = CSV.parse(csv_text, headers: true)
# csv.each do |row|
#   t = Restaurant.new
#   t.name = row['name']
#   t.location = row['location']
#   t.address = row['address']
#   t.url = row['url']
#   t.description = Faker::Lorem.paragraph(sentence_count: Faker::Number.between(from: 1, to: 6))
#   t.save
# end

puts "Done"
