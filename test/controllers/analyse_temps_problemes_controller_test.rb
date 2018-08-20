require 'test_helper'

class AnalyseTempsProblemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analyse_temps_probleme = analyse_temps_problemes(:one)
  end

  test "should get index" do
    get analyse_temps_problemes_url
    assert_response :success
  end

  test "should get new" do
    get new_analyse_temps_probleme_url
    assert_response :success
  end

  test "should create analyse_temps_probleme" do
    assert_difference('AnalyseTempsProbleme.count') do
      post analyse_temps_problemes_url, params: { analyse_temps_probleme: { hdirect: @analyse_temps_probleme.hdirect, obj: @analyse_temps_probleme.obj, tmpdef: @analyse_temps_probleme.tmpdef } }
    end

    assert_redirected_to analyse_temps_probleme_url(AnalyseTempsProbleme.last)
  end

  test "should show analyse_temps_probleme" do
    get analyse_temps_probleme_url(@analyse_temps_probleme)
    assert_response :success
  end

  test "should get edit" do
    get edit_analyse_temps_probleme_url(@analyse_temps_probleme)
    assert_response :success
  end

  test "should update analyse_temps_probleme" do
    patch analyse_temps_probleme_url(@analyse_temps_probleme), params: { analyse_temps_probleme: { hdirect: @analyse_temps_probleme.hdirect, obj: @analyse_temps_probleme.obj, tmpdef: @analyse_temps_probleme.tmpdef } }
    assert_redirected_to analyse_temps_probleme_url(@analyse_temps_probleme)
  end

  test "should destroy analyse_temps_probleme" do
    assert_difference('AnalyseTempsProbleme.count', -1) do
      delete analyse_temps_probleme_url(@analyse_temps_probleme)
    end

    assert_redirected_to analyse_temps_problemes_url
  end
end
