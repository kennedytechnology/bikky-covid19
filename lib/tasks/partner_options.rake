namespace :partner_options do
  desc "Run seeds for Partner Options"
  task seed1: :environment do
    mood = ["Chillin with homies", "Home comfort", "It's a family affair", "Keep grindin", "Oh you fancy huh", "TREAT YO SELF", "Too cool for school", "Your body is a temple"]
    mood.each { |m| Mood.create!(name: m) }

    daypart1 = ["Afternoon Delight", "Breakfast", "Dessert", "Dinner", "Lunch"]
    daypart1.each { |dp1| Daypart1.create!(name: dp1) }

    daypart2 = ["Afternoon Delight", "Breakfast", "Dessert", "Dinner", "Lunch"]
    daypart2.each { |dp2| Daypart2.create!(name: dp2) }

    mealsize1 = ["Full House", "Social Distance", "Trapped with roommate"]
    mealsize1.each { |ms1| MealSize1.create!(name: ms1) }

    mealsize2 = ["Full House", "Social Distance", "Trapped with roommate"]
    mealsize2.each { |ms2| MealSize2.create!(name: ms2) }

    deal = ["none"]
    deal.each { |d| Deal.create!(name: d) }
  end
  # rake partner_options:seed1
end
