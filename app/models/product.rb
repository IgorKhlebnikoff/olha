class Product < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  default_scope { order('created_at DESC') }

  has_many :variants, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :assortment

  ratyrate_rateable "quality", "price"

  accepts_nested_attributes_for :variants, allow_destroy: true,
    reject_if: ->(attributes) do
      %w{color_id size_id price}.all? { |attr| attributes[attr].empty? }
    end
  mapping do
    indexes :name, analyzer: 'snowball', boost: 100
    indexes :description, analyzer: 'snowball'
  end

  class << self
    def search(term)
      tire.search do
        query do
          boolean do
            must { string term }
          end
        end
      end
    end
  end
end
