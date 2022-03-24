require_relative "abstract_db_test"

#noinspection RubyInstanceMethodNamingConvention
class TestProduct < AbstractDbTest
  # @note Exigency 3.1
  def test_cheap_products
    expected_count = 2
    cheap_limit = 0.20

    cheap_products = Product.cheap

    assert_equal expected_count, cheap_products.count
    cheap_products.each { |product| assert_operator product.price, '<=', cheap_limit }
  end

  # @note Exigency 3.1
  # @see https://ruby-doc.org/core-2.0.0/Array.html#method-i-2D
  def test_not_cheap_products
    expected_count = 3
    cheap_limit = 0.20

    not_cheap_products = Product.all - Product.cheap

    assert_equal expected_count, not_cheap_products.count
    not_cheap_products.each { |product| assert_operator product.price, '>', cheap_limit }
  end
end
