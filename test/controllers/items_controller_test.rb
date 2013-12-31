require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  include APIControllerTest
  def test_it_lists_items
    get_json(:index)
    assert_status 200
  end

end
