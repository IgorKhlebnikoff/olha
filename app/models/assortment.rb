class Assortment < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :products

  belongs_to :category
  
  attr_accessible :name, :category_id

  validates :name, presence: true
end
