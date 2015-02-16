class AuthenticationsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
    if authentication
      flash[:notice] = I18n.t('controllers.authentications.signed')
      sign_in_and_redirect(:user, authentication.user)
    else
      user = User.new
      user.apply_omniauth(auth)
      if user.save
        flash[:notice] = I18n.t('controllers.authentications.acount_createdand_signed')
        sign_in_and_redirect(:user, user)
      else
        flash[:error] = I18n.t('controllers.authentications.signed_error')
        redirect_to root_url
      end
    end
  end

  private

  def authentication_params
    params.require(:authentication).permit(:provider, :token, :uid, :user_id)
  end
end
