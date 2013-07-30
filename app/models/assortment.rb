class Assortment < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :products

  belongs_to :category
  
  attr_accessible :name, :category_id

  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true
end
