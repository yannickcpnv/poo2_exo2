require "minitest/autorun"
require_relative '../../connection'
require_relative "../../models/order_item"
require_relative "../../models/product"

#noinspection RubyInstanceMethodNamingConvention
class TestOrderItem < Minitest::Test
  # Exigency 5
  def test_item_price_is_copied_from_product_price_before_creation
    product = Product.first
    order_item = OrderItem.create quantity: 3, product: product

    assert_equal product.price, order_item.item_price
  end
end
