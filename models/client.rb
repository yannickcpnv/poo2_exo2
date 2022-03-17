class Client < ActiveRecord::Base
  has_many :orders
  has_many :ordered_products, through: :orders, :source => :products
end
