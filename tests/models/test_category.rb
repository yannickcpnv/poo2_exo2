require_relative 'db_test'

class TestCategory < Minitest::Test
  include DbTest

  # Exigency S.2
  def test_not_ordered
    expected_count = 1

    categories = Category.not_ordered

    assert_equal expected_count, categories.count
  end
end
