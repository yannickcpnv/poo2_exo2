class TestHelpers
  def self.make_valid_individual
    Individual.new firstname: 'yannick', lastname: 'baudraz'
  end

  def self.make_valid_order
    order = Order.new status: 'PROGRESS', client: Client.first
    order.order_items.build quantity: 10, product: Product.first

    order
  end
end
