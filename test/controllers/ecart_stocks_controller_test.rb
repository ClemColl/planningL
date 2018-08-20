require 'test_helper'

class EcartStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ecart_stock = ecart_stocks(:one)
  end

  test "should get index" do
    get ecart_stocks_url
    assert_response :success
  end

  test "should get new" do
    get new_ecart_stock_url
    assert_response :success
  end

  test "should create ecart_stock" do
    assert_difference('EcartStock.count') do
      post ecart_stocks_url, params: { ecart_stock: { ecart: @ecart_stock.ecart, obj: @ecart_stock.obj, valeur: @ecart_stock.valeur } }
    end

    assert_redirected_to ecart_stock_url(EcartStock.last)
  end

  test "should show ecart_stock" do
    get ecart_stock_url(@ecart_stock)
    assert_response :success
  end

  test "should get edit" do
    get edit_ecart_stock_url(@ecart_stock)
    assert_response :success
  end

  test "should update ecart_stock" do
    patch ecart_stock_url(@ecart_stock), params: { ecart_stock: { ecart: @ecart_stock.ecart, obj: @ecart_stock.obj, valeur: @ecart_stock.valeur } }
    assert_redirected_to ecart_stock_url(@ecart_stock)
  end

  test "should destroy ecart_stock" do
    assert_difference('EcartStock.count', -1) do
      delete ecart_stock_url(@ecart_stock)
    end

    assert_redirected_to ecart_stocks_url
  end
end
