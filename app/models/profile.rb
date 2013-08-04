class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :first_name, :last_name, :phone_number, :gender, :user_id

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
