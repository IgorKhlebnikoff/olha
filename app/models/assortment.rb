class Assortment < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  default_scope { order('name ASC') }

  has_many :products
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true

  accepts_nested_attributes_for :category
end
