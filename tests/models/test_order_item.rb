require_relative "abstract_db_test"

#noinspection RubyInstanceMethodNamingConvention
class TestOrderItem < AbstractDbTest
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
  def test_before_create_item_price_is_copied_from_product_price
    order_item = TestHelpers.make_valid_order_item

    order_item.save

    assert_equal order_item.product.price, order_item.item_price
  end

  # Exigency 9
  def test_after_save_create_add_quantity
    # New order item with a quantity of 10
    order_item = TestHelpers.make_valid_order_item
    expected_level_of_stock = 387

    order_item.save!

    assert_equal expected_level_of_stock, order_item.product.level_of_stock
  end

  # Exigency 9
  def test_after_save_update_add_quantity
    order_item = OrderItem.second
    expected_level_of_stock = 267

    order_item.update! quantity: 130

    assert_equal expected_level_of_stock, Product.third.level_of_stock
  end

  # Exigency 9
  def test_after_save_update_remove_quantity
    order_item = OrderItem.second
    expected_level_of_stock = 277

    order_item.update! quantity: 120

    assert_equal expected_level_of_stock, Product.third.level_of_stock
  end
end
