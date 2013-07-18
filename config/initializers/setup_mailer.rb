ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'olha.com',
  user_name: 'olha.default@gmail.com',
  password: '123123123aa',
  authentication: 'plain',
  enable_starttls_auto: true
}
