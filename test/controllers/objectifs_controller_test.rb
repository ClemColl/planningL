require 'test_helper'

class ObjectifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @objectif = objectifs(:one)
  end

  test "should get index" do
    get objectifs_url
    assert_response :success
  end

  test "should get new" do
    get new_objectif_url
    assert_response :success
  end

  test "should create objectif" do
    assert_difference('Objectif.count') do
      post objectifs_url, params: { objectif: { name: @objectif.name, value: @objectif.value } }
    end

    assert_redirected_to objectif_url(Objectif.last)
  end

  test "should show objectif" do
    get objectif_url(@objectif)
    assert_response :success
  end

  test "should get edit" do
    get edit_objectif_url(@objectif)
    assert_response :success
  end

  test "should update objectif" do
    patch objectif_url(@objectif), params: { objectif: { name: @objectif.name, value: @objectif.value } }
    assert_redirected_to objectif_url(@objectif)
  end

  test "should destroy objectif" do
    assert_difference('Objectif.count', -1) do
      delete objectif_url(@objectif)
    end

    assert_redirected_to objectifs_url
  end
end
