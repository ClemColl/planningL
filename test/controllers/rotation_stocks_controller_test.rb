require 'test_helper'

class RotationStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rotation_stock = rotation_stocks(:one)
  end

  test "should get index" do
    get rotation_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_rotation_stock_url
    assert_response :success
  end

  test "should create rotation_stock" do
    assert_difference('RotationStock.count') do
      post rotation_stocks_url, params: { rotation_stock: { mois: @rotation_stock.mois, objectif: @rotation_stock.objectif, rotation: @rotation_stock.rotation } }
    end

    assert_redirected_to rotation_stock_url(RotationStock.last)
  end

  test "should show rotation_stock" do
    get rotation_stock_url(@rotation_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_rotation_stock_url(@rotation_stock)
    assert_response :success
  end

  test "should update rotation_stock" do
    patch rotation_stock_url(@rotation_stock), params: { rotation_stock: { mois: @rotation_stock.mois, objectif: @rotation_stock.objectif, rotation: @rotation_stock.rotation } }
    assert_redirected_to rotation_stock_url(@rotation_stock)
  end

  test "should destroy rotation_stock" do
    assert_difference('RotationStock.count', -1) do
      delete rotation_stock_url(@rotation_stock)
    end

    assert_redirected_to rotation_stocks_url
  end
end
