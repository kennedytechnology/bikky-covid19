module ApplicationHelper
  def is_tab_active?(controller_name)
    "active" if params[:controller] == controller_name
  end
end
