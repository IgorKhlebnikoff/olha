require 'csv'

namespace :db do
  desc "Erase and fill database with necessery info"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Currency, Size, Category, Assortment, Color, Product, Variant].each(&:delete_all)

    Currency.create!(:name => 'USD')
    Currency.create!(:name => 'UAH')

    Size.populate 10 do |size|
      size.name = 10 + size.id
    end
    
    CSV.foreach('lib/tasks/colors.csv', headers: true, header_converters: :symbol) do |row|
      Color.find_or_create_by_name(name: row[:value])
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
              variant.color_id = Color.first(order: "RANDOM()")
              variant.size_id = Size.first(order: "RANDOM()")
              variant.quantity = 99
            end
        end

      end
    end



  end
end
