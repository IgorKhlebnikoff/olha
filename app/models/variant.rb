class Variant < ActiveRecord::Base
  has_many :wanters, through: :wish_lists, source: :user
  has_many :wish_lists, foreign_key: 'wish_id'

  belongs_to :product
  belongs_to :color
  belongs_to :size

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/no_image.jpg"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  validates :in_stock, presence: true
  validates :color_id, :size_id, presence: true

  delegate :name, :description, to: :product
end
