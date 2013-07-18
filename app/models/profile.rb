class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :first_name, :last_name, :phone_number, :gender, :user_id

  def full_name
    "#{last_name} #{first_name}"
  end
end
