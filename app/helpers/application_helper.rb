module ApplicationHelper
  def admin_side
    'admins' if params[:controller].include?('admin')
  end
end
