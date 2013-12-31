require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  include  APIControllerTest

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

    assert_response :success
    data = JSON.parse(@response.body)
    assert_equal order.id, data["id"]
  end

  def test_it_creates_an_order
    #build the data parameters
    #submit that to the create url
    #check that we get back a 201 created

    params = {:order => {:amount => 9.00, :user_id => 2},  :format => :json}
    post :create, params
    #assert_equal 201, @response.status
    assert_status 201
  end
end
