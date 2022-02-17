require_relative 'connection'
require_relative 'models'

def process_crud
  puts '--Creation of 1 category and 3 products--'
  category = Category.create(name: 'PCR')
  puts "Category N°#{category.id} : #{category.name}"
  puts 'All products :'
  product1 = Product.create(name: 'first product', price: 2.35, description: 'Little apple', category: category)
  product2 = Product.create(name: 'second product', price: 6.15, description: 'Big lemon', category: category)
  product3 = Product.create(name: 'third product', price: 200, description: 'A truck', category: category)
  Product.all.each { |p| puts "#{p.description}. #{p.name} has a price of #{p.price} and belongs to #{p.category.name} category." }
  puts

  puts '--Creation of a client--'
  client = Client.new
  client.firstname = 'yannick'
  client.lastname = 'baudraz'
  client.save
  puts "#{client.firstname} #{client.lastname}"
  puts

  puts '--The client takes 1 orders with 2 products--'
  first_order = Order.create(status: 'PROGRESS')
  puts "Order N°#{first_order.id} : #{first_order.status}"
  OrderItem.create(quantity: 2, order: first_order, product: product1)
  OrderItem.create(quantity: 4, order: first_order, product: product2)
  client.orders << first_order

  client.orders.each do |o|
    o.order_items.each do |oi|
      total = oi.quantity * oi.product.price
      puts "#{client.firstname} #{client.lastname} took #{oi.quantity} of #{oi.product.name}, for a total of #{total}CHF"
    end
  end
  puts

  puts '--Update of the client lastname--'
  client.update lastname: 'doe'
  puts "#{client.firstname} #{client.lastname}"
  puts

  puts '--Deletion of the third product--'
  product3.destroy
  product3.name = 'bof'
end

process_crud
