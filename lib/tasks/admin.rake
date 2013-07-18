namespace :admin do
  # admin:create email=email@example.com
  desc "add admin role to user with specific email"
  task :create => :environment do
    email = ENV['email']
    user = User.find_by_email(email)
    user.role = Role.find_by_name('admin')
    user.save
  end

end
