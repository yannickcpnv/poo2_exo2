require_relative "test"

#noinspection RubyInstanceMethodNamingConvention
class TestClient < Minitest::Test
  def setup
    @client = TestHelpers.make_valid_client
  end

  # @note Exigency 3.1
  def test_cheap_products_ordered
    cheap_limit = 0.20
    expected_count = 4
    cheap_products = Client.first.ordered_products.cheap

    assert_equal expected_count, cheap_products.count
    cheap_products.each { |product| assert_operator product.price, '<=', cheap_limit }
  end

  # @note Exigency 4.1
  def test_firstname_not_present_is_invalid
    @client.firstname = nil

    assert @client.invalid?
  end

  # @note Exigency 4.1
  def test_lastname_not_present_is_invalid
    @client.lastname = nil

    assert @client.invalid?
  end

  # @note Exigency 4.1
  def test_firstname_too_short_is_invalid
    @client.firstname = 'u'

    assert @client.invalid?
  end

  # @note Exigency 4.1
  def test_lastname_too_short_is_invalid
    @client.lastname = 'u'

    assert @client.invalid?
  end
end
