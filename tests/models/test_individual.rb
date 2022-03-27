require_relative "db_test"

#noinspection RubyInstanceMethodNamingConvention
class TestIndividual < Minitest::Test
  include DbTest

  def setup
    super
    @individual = TestHelpers.make_valid_individual
  end

  # @note Exigency 3.1
  def test_cheap_products_ordered
    cheap_limit = 0.20
    expected_count = 4
    cheap_products = Individual.first.ordered_products.cheap

    assert_equal expected_count, cheap_products.count
    cheap_products.each { |product| assert_operator product.price, '<=', cheap_limit }
  end

  # @note Exigency 4.1
  def test_firstname_not_present_is_invalid
    @individual.firstname = nil

    assert @individual.invalid?
  end

  # @note Exigency 4.1
  def test_lastname_not_present_is_invalid
    @individual.lastname = nil

    assert @individual.invalid?
  end

  # @note Exigency 4.1
  def test_firstname_too_short_is_invalid
    @individual.firstname = 'u'

    assert @individual.invalid?
  end

  # @note Exigency 4.1
  def test_lastname_too_short_is_invalid
    @individual.lastname = 'u'

    assert @individual.invalid?
  end
end
