require 'test_helper'

class ApprosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appro = appros(:one)
  end

  test "should get index" do
    get appros_url
    assert_response :success
  end

  test "should get new" do
    get new_appro_url
    assert_response :success
  end

  test "should create appro" do
    assert_difference('Appro.count') do
      post appros_url, params: { appro: { ghh: @appro.ghh, ghm: @appro.ghm, sghh: @appro.sghh, sghm: @appro.sghm } }
    end

    assert_redirected_to appro_url(Appro.last)
  end

  test "should show appro" do
    get appro_url(@appro)
    assert_response :success
  end

  test "should get edit" do
    get edit_appro_url(@appro)
    assert_response :success
  end

  test "should update appro" do
    patch appro_url(@appro), params: { appro: { ghh: @appro.ghh, ghm: @appro.ghm, sghh: @appro.sghh, sghm: @appro.sghm } }
    assert_redirected_to appro_url(@appro)
  end

  test "should destroy appro" do
    assert_difference('Appro.count', -1) do
      delete appro_url(@appro)
    end

    assert_redirected_to appros_url
  end
end
