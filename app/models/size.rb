class Size < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :variants

  attr_accessible :name

  validates :name, presence: true
end
