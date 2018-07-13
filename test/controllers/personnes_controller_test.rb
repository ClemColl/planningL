require 'test_helper'

class PersonnesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personne = personnes(:one)
  end

  test "should get index" do
    get personnes_url
    assert_response :success
  end

  test "should get new" do
    get new_personne_url
    assert_response :success
  end

  test "should create personne" do
    assert_difference('Personne.count') do
      post personnes_url, params: { personne: {  } }
    end

    assert_redirected_to personne_url(Personne.last)
  end

  test "should show personne" do
    get personne_url(@personne)
    assert_response :success
  end

  test "should get edit" do
    get edit_personne_url(@personne)
    assert_response :success
  end

  test "should update personne" do
    patch personne_url(@personne), params: { personne: {  } }
    assert_redirected_to personne_url(@personne)
  end

  test "should destroy personne" do
    assert_difference('Personne.count', -1) do
      delete personne_url(@personne)
    end

    assert_redirected_to personnes_url
  end
end
