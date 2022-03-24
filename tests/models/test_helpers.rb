class TestHelpers
  def self.make_valid_individual
    Individual.new firstname: 'yannick', lastname: 'baudraz'
  end

  # Make a new order from the first client with the first product (quantity: 10). The order is not stored in the
  # database yet.
  #
  # @return [Order]
  def self.make_valid_order
    order = Order.new status: 'PROGRESS', client: Client.first
    order.order_items.build quantity: 10, product: Product.first

    order
  end

  # Make a new order item from the first client with the first product (quantity: 10). The order item is not stored in
  # the database yet.
  #
  # @return [OrderItem]
  def self.make_valid_order_item
    self.make_valid_order.order_items.first
  end
end
