require 'csv'
puts "Start seeding..."
csv_text = File.read(Rails.root.join('lib', 'seeds', 'partners_updates.csv'))
CSV.parse(csv_text, headers: true).each do |row|
  row.delete('id')
  row['price'] = row['price'].length if row['price']
  Partner.create!(row.to_h)
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'restaurants_updates.csv'))
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  row['partner'] = Partner.find_by_brand(row.delete('brand'))
  row['url'].strip!
  row['url'] = ActionController::Base.helpers.number_to_phone(row['url'].delete("^0-9"), area_code: true) unless row['url'].start_with?("http")
  Restaurant.create!(row.to_h) if row['partner']
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'guides.csv'))
CSV.parse(csv_text, headers: true).each do |row|
  Guide.create!(row.to_h)
end

partners = Partner.where(brand: ["Dos Toros", "Just Salad", "The Kati Roll Company", "Little Beet"])
Guide.find_by_name("Because you want an office lunch...but in your underwear").partners << partners

partners = Partner.where(brand: ["Stone Bridge", "Sticky’s Finger Joint", "Bareburger", "Rubirosa"])
Guide.find_by_name("Because you’re getting HYPED while streaming Twitch").partners << partners

partners = Partner.where(brand: ["Carbone", "Mission Chinese Food", "Balthazar", "Pasquale Jones", "Russ & Daughters Cafe"])
Guide.find_by_name("BECAUSE THIS IS NEW YORK").partners << partners

partners = Partner.where(brand: ["Amma", "Mexicue", "Chez Nick", "I Sodi"])
Guide.find_by_name("Because date night CAN happen in your kitchen").partners << partners

partners = Partner.where(brand: ["Sweetberry", "Pure Green", "Juice Press"])
Guide.find_by_name("Because you don’t need the gym to keep lookin fly").partners << partners

partners = Partner.where(brand: ["The Meatball Shop", "Poulet Sans Tete", "Maison Yaki"])
Guide.find_by_name("Because food comas are a form of happiness").partners << partners

partners = Partner.where(brand: ["Hunky Dory", "Sadelle’s", "Chip", "Doughnut Plant"])
Guide.find_by_name("Because this quarantine ain’t getting me down").partners << partners

partners = Partner.where(brand: ["Raku", "Brodo Broth", "Ivan Ramen", "Springbone Kitchen"])
Guide.find_by_name("Because you really need a cuddle").partners << partners

AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")

puts "Done"