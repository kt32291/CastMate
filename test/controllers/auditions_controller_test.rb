require 'test_helper'

class AuditionsControllerTest < ActionController::TestCase
  setup do
    @audition = auditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audition" do
    assert_difference('Audition.count') do
      post :create, audition: { audition_end: @audition.audition_end, audition_start: @audition.audition_start, description: @audition.description, equity: @audition.equity, name: @audition.name, play_id: @audition.play_id, theatre_id: @audition.theatre_id }
    end

    assert_redirected_to audition_path(assigns(:audition))
  end

  test "should show audition" do
    get :show, id: @audition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @audition
    assert_response :success
  end

  test "should update audition" do
    patch :update, id: @audition, audition: { audition_end: @audition.audition_end, audition_start: @audition.audition_start, description: @audition.description, equity: @audition.equity, name: @audition.name, play_id: @audition.play_id, theatre_id: @audition.theatre_id }
    assert_redirected_to audition_path(assigns(:audition))
  end

  test "should destroy audition" do
    assert_difference('Audition.count', -1) do
      delete :destroy, id: @audition
    end

    assert_redirected_to auditions_path
  end
end
