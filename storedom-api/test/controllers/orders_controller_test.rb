require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  include  APIControllerTest

  def test_it_shows_orders
    2.times{ Order.create }
    data = get_json(:index)
    assert_equal 2, data.count
  end

  def test_it_responds_with_a_single_order
    order = Order.create
    data = get_json(:show, :id => order.id)
    assert_equal order.id, data["id"]
  end

  def test_it_creates_an_order
    params = {:order => {:amount => 9.00, :user_id => 2},  :format => :json}
    post :create, params
    assert_status 201
  end
end
