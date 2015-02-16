class Currency < ActiveRecord::Base
  has_many :prices

  validates :name, presence: true
end
