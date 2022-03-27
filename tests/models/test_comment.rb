require_relative "db_test"

#noinspection RubyInstanceMethodNamingConvention
class TestComment < Minitest::Test
  include DbTest

  # @note Exigency 8
  def test_client_create_comments
    client = Client.second
    client.comments << [
      Comment.new(body: 'Good', target: Product.first),
      Comment.new(body: 'Medium', target: Supplier.first),
      Comment.new(body: 'Interesssssant', target: Supplier.second),
    ]

    comments = Comment.where author: client
    comments.each { |c| assert_equal c.author, client }
    comments.delete_all
  end

  # @note Exigency 8
  def test_client_with_comments_in_product_and_supplier
    expected_comment_count = 3
    expected_second_comment_body = 'This is REALLY bad !'

    comments = Client.first.comments

    assert_equal expected_comment_count, comments.count
    assert_equal expected_second_comment_body, comments.second.body
  end
end
