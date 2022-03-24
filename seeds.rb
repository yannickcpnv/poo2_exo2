require_relative 'connection'
require_relative 'models'

pcr = Category.create!(name: 'PCR')
sup = Category.create!(name: 'SUP')

product1 = Product.create!(name: 'apple', price: 0.15, description: 'Little apple', category: pcr)
product2 = Product.create!(name: 'lemon', price: 6.15, description: 'Big lemon', category: pcr)
product3 = Product.create!(name: 'limousine', price: 25.95, description: 'A limousine', category: sup)
product4 = Product.create!(name: 'lollipop', price: 0.20, description: 'Chupa chup', category: sup)
product5 = Product.create!(name: 'truck', price: 200, description: 'A truck', category: sup)

Supplier.create(
  [
    { name: 'migros' },
    { name: 'migros', phone_number: '+41214266613' },
    { name: 'denner' },
    { name: 'manor' },
  ]
)
Supplier.first.products << [product1]
Supplier.second.products << [product2, product3, product4]
Supplier.third.products << [product5]
supplier = Supplier.first

client = Individual.create!(firstname: 'yannick', lastname: 'baudraz')
Individual.create!(firstname: 'john', lastname: 'doedoe')
Individual.create!(firstname: 'business', lastname: 'man', premium: true, loyalty_points: 99)
Company.create!(brand: 'apple', employees_number: 42373)
Company.create!(brand: 'cpnv', employees_number: 2)

client.orders.create(status: 'PROGRESS', client: client, order_items: [
  OrderItem.new(quantity: 2, product: product1),
  OrderItem.new(quantity: 125, product: product3),
  OrderItem.new(quantity: 3, product: product4)
])

order2 = Order.new(status: 'PROGRESS', client: client)
order2.order_items << [
  OrderItem.new(quantity: 1, product: product1),
  OrderItem.new(quantity: 75, product: product2),
  OrderItem.new(quantity: 3, product: product3),
  OrderItem.new(quantity: 200, product: product4)
]
order2.save!

client.comments << [
  Comment.new(body: 'This is bad !', target: product1),
  Comment.new(body: 'This is REALLY bad !', target: Supplier.first),
  Comment.new(body: 'This one is good :)', target: Supplier.second),
]

puts '--SEEDERS DONE--'