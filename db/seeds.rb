require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurants.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  t = Restaurant.new
  t.name = row['name']
  t.location = row['location']
  t.address = row['address']
  t.url = row['url']
  t.description = Faker::Lorem.paragraph(sentence_count: Faker::Number.between(from: 1, to: 6))
  t.save
end

if ENV["DEFAULT_ADMIN_PASSWORD"]
  AdminUser.create!(email: "admin@project-facemask.com", password: ENV["DEFAULT_ADMIN_PASSWORD"], password_confirmation: ENV["DEFAULT_ADMIN_PASSWORD"])
else
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end
puts "Done"