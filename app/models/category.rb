class Category < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :assortments

  attr_accessible :name

  validates :name, presence: true, uniqueness: true
end
