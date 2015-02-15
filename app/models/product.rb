class Product < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  default_scope { order('created_at DESC') }

  has_many :variants, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :assortment

  ajaxful_rateable { conditions.where( stars: 5, dimensions: [:quality]) }

  accepts_nested_attributes_for :variants

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
