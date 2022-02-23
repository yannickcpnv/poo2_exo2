require_relative 'connection'
require_relative 'models'

def ex3
  client = Client.first
  puts "Use client => #{client}"

  puts '--Display cheap products from client--'
  client.products.cheap.each { |p| puts p }

  puts '--Display products ordered with a quantity of more than 50 from client--'
  client.order_items.bulk(50).each { |oi| puts "#{oi.product}; Ordered #{oi.quantity}" }

  puts
end

def ex4

end

ex3
