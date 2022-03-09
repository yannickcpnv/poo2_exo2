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

def ex4
  puts "--EXIGENCY N°4--"
  puts

  puts "--Try to create a client without firstname--"
  begin
    Client.create!(lastname: 'doueh')
  rescue => e
    puts e
  end
  puts

  puts "--Try to create a client without lastname--"
  begin
    Client.create!(firstname: 'jouhny')
  rescue => e
    puts e
  end
  puts

  puts "--Try to create a client with a 4 characters lastname--"
  begin
    Client.create!(firstname: 'jouhny', lastname: 'dodo')
  rescue => e
    puts e
  end
  puts

  puts "--Try to do an order that doesn't have any product--"
  begin
    Order.create!(status: 'PROGRESS')
  rescue => e
    puts e
  end
  puts

  puts
end

def ex5
  puts "--EXIGENCY N°5--"
  puts

  puts '--Display each orders total price--'
  Order.all.each { |o| puts "Order N°#{o.id} : #{o.total_price}CHF" }
end

ex3
ex4
ex5
