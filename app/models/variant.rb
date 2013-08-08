class Variant < ActiveRecord::Base
  has_many :wanters, through: :wish_lists, source: :user
  has_many :wish_lists, foreign_key: 'wish_id'

  belongs_to :product
  belongs_to :color
  belongs_to :size
  belongs_to :price

  validates :in_stock, presence: true
  validates :product_id, :color_id, :size_id, :price_id, presence: true

  delegate :name, :description, to: :product
end
