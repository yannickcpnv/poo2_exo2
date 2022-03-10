require_relative "test"

#noinspection RubyInstanceMethodNamingConvention
class TestOrderItem < Minitest::Test
  # @note Exigency 3.2
  def test_default_bulk
    expected_count = 2
    default_bulk = 100

    order_items = OrderItem.bulk

    assert_equal expected_count, order_items.count
    order_items.each { |order_item| assert_operator order_item.quantity, '>=', default_bulk }
  end

  # @note Exigency 3.2
  def test_bulk_with_50
    expected_count = 3
    bulk = 50

    order_items = OrderItem.bulk(bulk)

    assert_equal expected_count, order_items.count
    OrderItem.bulk(50).each { |order_item| assert_operator order_item.quantity, '>=', bulk }
  end

  # Exigency 5.2
  def test_item_price_is_copied_from_product_price_before_creation
    product = Product.first
    order = TestHelpers.make_valid_order
    order_item = order.order_items.first

    order_item.save

    assert_equal order_item.product.price, order_item.item_price

    # Delete the order
    order.order_items.delete
    order.delete
  end
end
