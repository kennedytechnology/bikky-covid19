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

csv_text = File.read(Rails.root.join('lib', 'seeds', 'guides.csv'))
CSV.parse(csv_text, headers: true).each do |row|
  Guide.create!(row.to_h)
end

partner_ids = Partner.where(brand: ["Dos Toros", "Just Salad", "The Kati Roll Company", "The Little Beet"]).ids
Restaurant.where(partner_id: partner_ids).each do |r|
  r.guides << Guide.find_by_name("Because you want an office lunch...but in your underwear")
end

partner_ids = Partner.where(brand: ["Stone Bridge", "Sticky’s Finger Joint", "Bareburger", "Rubirosa"]).ids
Restaurant.where(partner_id: partner_ids).each do |r|
  r.guides << Guide.find_by_name("Because you’re getting HYPED while streaming Twitch")
end

partner_ids = Partner.where(brand: ["Carbone", "Mission Chinese", "Balthazar", "Pasquale Jones", "Russ & Daughters"]).ids
Restaurant.where(partner_id: partner_ids).each do |r|
  r.guides << Guide.find_by_name("BECAUSE THIS IS NEW YORK")
end

partner_ids = Partner.where(brand: ["Amma", "Mexicue", "Chez Nick", "I Sodi"]).ids
Restaurant.where(partner_id: partner_ids).each do |r|
  r.guides << Guide.find_by_name("Because date night CAN happen in your kitchen")
end

partner_ids = Partner.where(brand: ["Sweetberry Bowls" "Pure Green", "Juice Press"]).ids
Restaurant.where(partner_id: partner_ids).each do |r|
  r.guides << Guide.find_by_name("Because you don’t need the gym to keep lookin fly")
end

partner_ids = Partner.where(brand: ["Meatball Shop", "Poulet Sans Tete", "Maison Yaki"]).ids
Restaurant.where(partner_id: partner_ids).each do |r|
  r.guides << Guide.find_by_name("Because food comas are a form of happiness")
end

partner_ids = Partner.where(brand: ["Hunky Dory", "Sadelle’s", "Chip", "Doughnut Plant"]).ids
Restaurant.where(partner_id: partner_ids).each do |r|
  r.guides << Guide.find_by_name("Because this quarantine ain’t getting me down")
end

partner_ids = Partner.where(brand: ["Raku", "Brodo Broth", "Ivan Ramen", "Springbone Kitchen"]).ids
Restaurant.where(partner_id: partner_ids).each do |r|
  r.guides << Guide.find_by_name("Because you really need a cuddle")
end

puts "Done"
