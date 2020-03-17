module ApplicationHelper
  def find_motto(restaurant_name)
    case restaurant_name
    when "Dos Toros"
      return "Because you want an office lunch but are on your couch in your underwear"
    when "Stone Bridge"
      return "Because you’re streaming Twitch / eSports more than ever before"
    when "PB&K" || "Juice Press"
      return "Because you just gotta get back on your Peloton"
    when "Bareburger"
      return "Because food comas are a form of happiness"
    when "Happiness Foods"
      return "Because this quarantine ain’t getting me down"
    when "test"
      return ""
    else
      return restaurant_name
    end
  end
end
