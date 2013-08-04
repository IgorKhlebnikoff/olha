class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_profile

  protected

  def is_admin?
    redirect_to root_path, alert: t('controllers.application.no_admin_permissions') unless current_user.is_admin?
  end

  def check_profile
    redirect_to new_profile_path if (current_user && !current_user.full_name)
  end
end
