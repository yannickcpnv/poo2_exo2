require_relative "db_test"

#noinspection RubyInstanceMethodNamingConvention
class TestClient < Minitest::Test
  include DbTest

  def test_inactive
    expected_inactive_count = 4
    active_client = Client.first

    inactive_clients = Client.inactive

    assert_equal expected_inactive_count, inactive_clients.count
    refute inactive_clients.include?(active_client)
  end
end
