require 'test_helper'

class NbGarantiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nb_garanty = nb_garanties(:one)
  end

  test "should get index" do
    get nb_garanties_url
    assert_response :success
  end

  test "should get new" do
    get new_nb_garanty_url
    assert_response :success
  end

  test "should create nb_garanty" do
    assert_difference('NbGarantie.count') do
      post nb_garanties_url, params: { nb_garanty: { gar: @nb_garanty.gar, gcp: @nb_garanty.gcp, ge: @nb_garanty.ge } }
    end

    assert_redirected_to nb_garanty_url(NbGarantie.last)
  end

  test "should show nb_garanty" do
    get nb_garanty_url(@nb_garanty)
    assert_response :success
  end

  test "should get edit" do
    get edit_nb_garanty_url(@nb_garanty)
    assert_response :success
  end

  test "should update nb_garanty" do
    patch nb_garanty_url(@nb_garanty), params: { nb_garanty: { gar: @nb_garanty.gar, gcp: @nb_garanty.gcp, ge: @nb_garanty.ge } }
    assert_redirected_to nb_garanty_url(@nb_garanty)
  end

  test "should destroy nb_garanty" do
    assert_difference('NbGarantie.count', -1) do
      delete nb_garanty_url(@nb_garanty)
    end

    assert_redirected_to nb_garanties_url
  end
end
