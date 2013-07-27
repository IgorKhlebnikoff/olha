namespace :admin do
  # admin:create email=email@example.com
  desc "add admin role to user with specific email"
  task :create => :environment do
    email = ENV['email']
    if user = User.find_by_email(email)
      user.role = Role.find_by_name('admin')
      user.save
      puts "It's OK!"
    else
      puts  "\n\n****************\n#{email} does not exist\n"
      puts  "You must enter email what you used in registration form\n"
      puts  "****************\n\n"
    end
  end
end