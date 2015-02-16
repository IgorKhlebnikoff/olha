class Size < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :variants

  validates :name, presence: true
end
