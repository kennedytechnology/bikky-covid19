module ApplicationHelper
  def is_tab_active?(controller_name)
    "active" if params[:controller] == controller_name
  end

  def restaurant_description(description)
    if description.blank?
      return ["Well doesn't 👆look tasty? Support this restaurant by ordering now.",
        "Deliciousness awaits you here.",
        "You're hungry, right? Eat well & support this restaurant by ordering today."].sample
    else
      return description
    end
  end

  def picture_url(partner)
    if partner.picture.attached?
      url_for(partner.picture)
    else
      image_url('restaurants_photos/default.jpeg')
    end
  end
end
