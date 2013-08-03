class Product < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :variants, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :assortment

  attr_accessible :name, :description, :assortment_id

  def paypal_url(return_url) 
    values = {
      business: YOUR_MERCHANT_EMAIL,
      cmd: '_cart',
      upload: 1,
      return: return_url,
      invoice: UNIQUE_INTEGER
    }

    values.merge!({
      "amount_1" => unit_price,
      "item_name_1" => name,
      "item_number_1" => id,
      "quantity_1" => '1'
    })
s
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
