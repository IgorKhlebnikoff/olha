class Product < ActiveRecord::Base
  has_many :variants, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :assortment

  attr_accessible :name, :description, :assortment_id
end
