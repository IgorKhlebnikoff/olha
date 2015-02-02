class Category < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  default_scope { order('name ASC') }

  has_many :assortments

  attr_accessible :name

  validates :name, presence: true, uniqueness: true
end
