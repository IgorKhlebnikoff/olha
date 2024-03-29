module ApplicationHelper
  def admin_side
    'admins' if params[:controller].include?('admin')
  end

  def flash_class(type)
    Constants::ALERT_TYPES[type]
  end
end
