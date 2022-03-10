require_relative 'connection'
require_relative 'models'

def ex3
  puts "--EXIGENCY N°3--"
  puts

  client = Client.first
  puts "Use client => #{client}"
  puts

  puts '--Display cheap products from client--'
  client.ordered_products.cheap.each { |p| puts p }
  puts

  puts '--Display products ordered with a quantity of more than 50 from client--'
  OrderItem.bulk(50).each { |oi| puts "#{oi.product}; Ordered #{oi.quantity}" }
  puts

  puts
end

ex3
