class Currency < ActiveRecord::Base
  has_many :prices

  attr_accessible :name

  validates :name, presence: true
end
