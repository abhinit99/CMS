require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get index1" do
    get test_index1_url
    assert_response :success
  end

  test "should get index2" do
    get test_index2_url
    assert_response :success
  end

  test "should get index3" do
    get test_index3_url
    assert_response :success
  end

end
