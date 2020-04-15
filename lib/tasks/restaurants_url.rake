namespace :restaurants_url do
  desc "Extract phone number if put inside URL"
  task extract_phone_from_url: :environment do
    restaurants = Restaurant.where.not(url: [nil, ""]).where.not("url LIKE ?", "http%")
    restaurants.each do |r|
      r.update_attributes(
        url: "",
        phone_number: ActionController::Base.helpers.number_to_phone(r.url.delete("^0-9"), area_code: true)
      )
    end
  end
end
