require "minitest/autorun"
require_relative '../../connection'
require_relative "../../models"

#noinspection RubyInstanceMethodNamingConvention
class TestOrder < Minitest::Test
  def create_valid_order
    @order = Order.new status: 'PROGRESS', client: Client.first
    @order.order_items.build quantity: 10, product: Product.first
  end

  def setup
    create_valid_order
  end

  #region Validations
  def test_valid_order
    assert @order.valid?
  end

  def test_order_without_items_is_invalid
    @order.order_items.clear

    assert @order.invalid?
  end

  def test_order_with_order_item_without_product_is_invalid
    @order.order_items.first.product = nil

    assert @order.invalid?
  end

  def test_order_with_order_item_without_quantity_is_invalid
    @order.order_items.first.quantity = nil

    assert @order.invalid?
  end

  def test_order_with_order_item_with_quantity_lesser_than_1_is_invalid
    @order.order_items.first.quantity = 0

    assert @order.invalid?
  end

  def test_order_with_order_item_with_decimal_quantity_is_invalid
    @order.order_items.first.quantity = 0

    assert @order.invalid?
  end

  #endregion

  # Exigency 5
  def test_total_price
    expected_price = 1498.5
    @order.order_items.clear
    @order.order_items << [
      OrderItem.new(quantity: 5, product: Product.first),
      OrderItem.new(quantity: 2, product: Product.second),
      OrderItem.new(quantity: 11, product: Product.third),
      OrderItem.new(quantity: 6, product: Product.fourth)
    ]
    @order.save

    assert_equal expected_price, @order.total_price
  end
end
