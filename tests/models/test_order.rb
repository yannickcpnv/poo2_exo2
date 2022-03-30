require_relative "db_test"

#noinspection RubyInstanceMethodNamingConvention
class TestOrder < Minitest::Test
  include DbTest

  def setup
    super
    @order = TestHelpers.make_valid_order
  end

  #region Validations

  # Exigency 4.2
  def test_valid_order
    assert @order.valid?
  end

  # Exigency 4.2
  def test_order_without_items_is_invalid
    @order.order_items.clear

    assert @order.invalid?
  end

  # Exigency 4.2
  def test_order_with_order_item_without_product_is_invalid
    @order.order_items.first.product = nil

    assert @order.invalid?
  end

  # Exigency 4.2
  def test_order_with_order_item_without_quantity_is_invalid
    @order.order_items.first.quantity = nil

    assert @order.invalid?
  end

  # Exigency 4.2
  def test_order_with_order_item_with_quantity_lesser_than_1_is_invalid
    @order.order_items.first.quantity = 0

    assert @order.invalid?
  end

  # Exigency 4.2
  def test_order_with_order_item_with_decimal_quantity_is_invalid
    @order.order_items.first.quantity = 0

    assert @order.invalid?
  end

  #endregion

  # Exigency 5.1
  def test_price
    expected_price = 1498.5
    @order.order_items.clear
    @order.order_items << [
      OrderItem.new(quantity: 5, product: Product.first),
      OrderItem.new(quantity: 2, product: Product.second),
      OrderItem.new(quantity: 11, product: Product.third),
      OrderItem.new(quantity: 6, product: Product.fifth)
    ]
    @order.save

    assert_equal expected_price, @order.price
  end

  # Exigency S.1
  def test_most_expensive
    expected_order = Order.first
    expected_order_price = expected_order.price #3244.65

    order = Order.most_expensive

    assert_equal expected_order, order
    assert_equal expected_order_price, order.price
  end

  def test_between_dates
    Client.first.orders.create(status: 'PROGRESS', client: Client.first, order_items: [
      OrderItem.new(quantity: 2, product: Product.first),
    ], created_at: 34.days.from_now)

    date_from = 10.days.from_now
    date_to = 2.months.from_now
    expected_orders_count = 2

    orders = Order.between_dates(date_from, date_to)

    assert_equal expected_orders_count, orders.count
  end
end
