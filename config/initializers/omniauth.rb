Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, CONF['facebook']['app_id'], CONF['facebook']['app_secret'],
    { scope: 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access' }
end
