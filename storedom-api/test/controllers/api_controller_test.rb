module APIControllerTest

  def get_json(action, params = {})
    get action, params.merge(:format => :json)
    assert_response :success
    JSON.parse(@response.body)
  end

  def assert_status(expected_code)
    assert_equal expected_code, @response.status
  end

end

