class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :first_name, :last_name, :phone_number, :gender, :user_id, :country

  validates :first_name, :last_name, presence: true,  length: { minimum: 2 }
  validates :phone_number, presence: true, numericality: true,  length: { minimum: 9 }
  validates :gender, inclusion: { in: %w(Male Female) }  
  validates :country, presence: true

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
