require "minitest/autorun"
require_relative '../../connection'
require_relative "../../models/client"

#noinspection RubyInstanceMethodNamingConvention
class TestClient < Minitest::Test
  def setup
    create_valid_client
  end

  def create_valid_client
    @client = Client.new firstname: 'yannick', lastname: 'baudraz'
  end

  def test_client_without_firstname_is_invalid
    @client.firstname = nil

    assert @client.invalid?
  end

  def test_client_without_lastname_is_invalid
    @client.lastname = nil

    assert @client.invalid?
  end

  def test_firstname_is_too_short
    @client.firstname = 'u'

    assert @client.invalid?
  end

  def test_lastname_is_too_short
    @client.lastname = 'u'

    assert @client.invalid?
  end
end
