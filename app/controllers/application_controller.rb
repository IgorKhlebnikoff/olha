class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def is_admin?
    redirect_to root_path, alert: t('controllers.application.no_admin_permissions') unless current_user.is_admin?
  end
end
