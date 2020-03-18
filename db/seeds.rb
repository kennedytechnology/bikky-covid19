require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'partners.csv'))
CSV.parse(csv_text, headers: true).each do |row|
  row['price'] = row['price'].length
  Partner.create!(row.to_h)
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurants.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  row['partner'] = Partner.find_by_brand(row.delete('brand'))
  Restaurant.create!(row.to_h)
end

puts "Done"
