require 'test_helper'

class LocasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loca = locas(:one)
  end

  test "should get index" do
    get locas_url
    assert_response :success
  end

  test "should get new" do
    get new_loca_url
    assert_response :success
  end

  test "should create loca" do
    assert_difference('Loca.count') do
      post locas_url, params: { loca: { address: @loca.address, name: @loca.name } }
    end

    assert_redirected_to loca_url(Loca.last)
  end

  test "should show loca" do
    get loca_url(@loca)
    assert_response :success
  end

  test "should get edit" do
    get edit_loca_url(@loca)
    assert_response :success
  end

  test "should update loca" do
    patch loca_url(@loca), params: { loca: { address: @loca.address, name: @loca.name } }
    assert_redirected_to loca_url(@loca)
  end

  test "should destroy loca" do
    assert_difference('Loca.count', -1) do
      delete loca_url(@loca)
    end

    assert_redirected_to locas_url
  end
end
