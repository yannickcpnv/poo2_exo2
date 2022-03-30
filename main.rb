require 'awesome_print'
require_relative 'connection'
require_relative 'models'

ActiveRecord::Base.observers << :product_observer
ActiveRecord::Base.instantiate_observers

awesome_print models = {
  categories: Category.all.to_a,
  clients: Client.all.to_a,
  orders: Order.all.to_a,
  products: Product.all.to_a,
  order_items: OrderItem.all.to_a,
  suppliers: Supplier.all.to_a,
  comments: Comment.all.to_a
}, indent: -4
