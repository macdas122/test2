require 'test_helper'

class PricedatasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pricedatas_index_url
    assert_response :success
  end

  test "should get new" do
    get pricedatas_new_url
    assert_response :success
  end

  test "should get create" do
    get pricedatas_create_url
    assert_response :success
  end

  test "should get destroy" do
    get pricedatas_destroy_url
    assert_response :success
  end

end
