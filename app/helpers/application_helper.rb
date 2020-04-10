module ApplicationHelper
  def is_tab_active?(controller_name)
    "active" if params[:controller] == controller_name
  end

  def picture_url(partner)
    if partner.picture.attached?
      url_for(partner.picture)
    else
      image_url('restaurants_photos/default.jpeg')
    end
  end
end
