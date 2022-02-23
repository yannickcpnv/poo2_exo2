require_relative 'connection'
require_relative 'models'

pcr = Category.create(name: 'PCR')
sup = Category.create(name: 'SUP')

product1 = Product.create(name: 'apple', price: 2.35, description: 'Little apple', category: pcr)
product2 = Product.create(name: 'lemon', price: 6.15, description: 'Big lemon', category: pcr)
product3 = Product.create(name: 'limousine', price: 25.95, description: 'A limousine', category: sup)
product4 = Product.create(name: 'truck', price: 200, description: 'A truck', category: sup)

client = Client.create(firstname: 'yannick', lastname: 'baudraz')
Client.create(firstname: 'john', lastname: 'doe')

order1 = Order.create(status: 'PROGRESS')
OrderItem.create(quantity: 2, order: order1, product: product1)
OrderItem.create(quantity: 125, order: order1, product: product3)
OrderItem.create(quantity: 3, order: order1, product: product4)
client.orders << order1

order2 = Order.create(status: 'PROGRESS')
OrderItem.create(quantity: 1, order: order2, product: product1)
OrderItem.create(quantity: 75, order: order2, product: product2)
OrderItem.create(quantity: 3, order: order2, product: product3)
OrderItem.create(quantity: 200, order: order2, product: product4)
client.orders << order2

puts '--SEEDERS DONE--'
