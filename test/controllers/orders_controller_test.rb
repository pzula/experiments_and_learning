require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  def test_it_shows_orders
    # Setup any necessary data
    2.times{ Order.create }

    # Make a JSON request
    get :index, :format => :json

    # Check that the request is ok
    assert_response :success

    # Check that we get the right data
    data = JSON.parse(@response.body)
    assert_equal 2, data.count
  end

  def test_it_responds_with_a_single_order
    order = Order.create
    get :show, :id => order.id, :format => :json
  end
end
