require 'awesome_print'
require_relative 'connection'
require_relative 'models'

awesome_print models = {
  categories: Category.all.to_a,
  clients: Client.all.to_a,
  orders: Order.all.to_a,
  products: Product.all.to_a,
  order_items: OrderItem.all.to_a
}, indent: -4
