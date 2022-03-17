require_relative 'test'

#noinspection RubyInstanceMethodNamingConvention
class TestSupplier < Minitest::Test
  def setup
    @supplier = nil
  end

  # @note Exigency 7
  def test_supplier_with_products_that_covers_1_category
    expected_category_count = 1

    supplier = Supplier.first

    assert_equal expected_category_count, supplier.categories.count
  end

  # @note Exigency 7
  def test_supplier_with_products_that_covers_2_category
    expected_category_count = 2

    supplier = Supplier.second

    assert_equal expected_category_count, supplier.categories.count
  end

  # @note Exigency 7
  def test_supplier_without_products_covers_no_category
    expected_category_count = 0

    supplier = Supplier.fourth

    assert_equal expected_category_count, supplier.categories.count
  end
end
