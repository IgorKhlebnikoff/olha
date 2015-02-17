require 'csv'

namespace :db do
  desc 'Erase and fill database with necessery info'
  task populate: :environment do
    require 'populator'
    require 'faker'

    [Currency, Size, Category, Assortment, Color, Product, Variant].each(&:delete_all)

    currencies = %w(USD UAH)
    currencies.each do |name|
      Currency.find_or_create_by(name: name)
    end

    Size.populate 10 do |size|
      size.name = 10 + size.id
    end
    
    CSV.foreach('lib/sources/colors.csv', headers: true, header_converters: :symbol) do |row|
      Color.find_or_create_by(name: row[:value])
    end

    Category.populate 10 do |category|
      category.name = "category #{category.id}"

      Assortment.populate 10 do |assortment|
        assortment.name = "assortment #{assortment.id}"
        assortment.category_id = category.id

        Product.populate 1 do |product|
          product.name = "product #{category.id}"
          product.description = "description of product #{category.id}"
          product.assortment_id = assortment.id

          Variant.populate 1 do |variant|
            variant.product_id = product.id
            variant.color_id = Color.order('RANDOM()').first
            variant.size_id = Size.order('RANDOM()').first
            variant.quantity = 99
            variant.price = Random.rand(100)
          end
        end
      end
    end
  end
end
