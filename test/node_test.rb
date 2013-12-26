gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def test_it_exists
    assert Node
  end

  def test_it_can_be_created_with_data
    new_node = Node.new("hello")
    assert_equal "hello", new_node.data
  end

  def test_it_has_a_link
    new_node = Node.new("bog")
    assert_nil new_node.link
  end

end