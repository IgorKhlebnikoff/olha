namespace :payments do
  desc "add payments systems"
    task :add_payments_systems => :environment do
      unless Payment.any?
        Payment.create(:name => :PayPal)
      end
    end
end
