require 'rails/observers/activerecord/active_record'

class ProductObserver < ActiveRecord::Observer
  def after_save(product)
    if product.level_of_stock < 5
      puts "The product #{product.description} is NEARLY OUT OF STOCK !"
    end
  end
end