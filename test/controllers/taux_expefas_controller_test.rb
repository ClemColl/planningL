require 'test_helper'

class TauxExpefasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taux_expefa = taux_expefas(:one)
  end

  test "should get index" do
    get taux_expefas_url
    assert_response :success
  end

  test "should get new" do
    get new_taux_expefa_url
    assert_response :success
  end

  test "should create taux_expefa" do
    assert_difference('TauxExpefa.count') do
      post taux_expefas_url, params: { taux_expefa: { nbligne: @taux_expefa.nbligne, obj: @taux_expefa.obj, taux: @taux_expefa.taux } }
    end

    assert_redirected_to taux_expefa_url(TauxExpefa.last)
  end

  test "should show taux_expefa" do
    get taux_expefa_url(@taux_expefa)
    assert_response :success
  end

  test "should get edit" do
    get edit_taux_expefa_url(@taux_expefa)
    assert_response :success
  end

  test "should update taux_expefa" do
    patch taux_expefa_url(@taux_expefa), params: { taux_expefa: { nbligne: @taux_expefa.nbligne, obj: @taux_expefa.obj, taux: @taux_expefa.taux } }
    assert_redirected_to taux_expefa_url(@taux_expefa)
  end

  test "should destroy taux_expefa" do
    assert_difference('TauxExpefa.count', -1) do
      delete taux_expefa_url(@taux_expefa)
    end

    assert_redirected_to taux_expefas_url
  end
end
