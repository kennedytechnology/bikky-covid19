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

  def link_to_cond(condition, name, options = {}, html_options = {}, &block)
    if condition
      name = name.call if name.is_a?(Proc)
      link_to(name, options, html_options, &block)
    elsif block_given?
      block.arity <= 1 ? capture(name, &block) : capture(name, options, html_options, &block)
    else
      ERB::Util.html_escape(name)
    end
  end
end
