class Role < ActiveRecord::Base
  has_many :users

  validates :name, presence: true

  attr_accessible :name
end
