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
  client = nil
  begin
    client = Client.new(firstname: 'jouhny', lastname: 'dodo')
    client.save!
  rescue => e
    puts e
    puts client.errors.inspect
  end
  puts

  puts "--Orders without product validation--"
  order = Order.new(status: 'PROGRESS', client: Client.first)
  begin
    order.save!
  rescue => e
    puts e
  end
  puts

  begin
    order.order_items.build
    order.save!
  rescue => e
    puts e
    puts order.order_items.map(&:errors).inspect
  end
  puts

  begin
    order.order_items.build(quantity: 10)
    order.save!
  rescue => e
    puts e
    puts order.order_items.map(&:errors).inspect
  end
  puts

  puts
end

ex3
ex4
