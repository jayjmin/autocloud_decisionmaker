require 'test_helper'

class OperatingsystemsControllerTest < ActionController::TestCase
  setup do
    @operatingsystem = operatingsystems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operatingsystems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operatingsystem" do
    assert_difference('Operatingsystem.count') do
      post :create, operatingsystem: { name: @operatingsystem.name }
    end

    assert_redirected_to operatingsystem_path(assigns(:operatingsystem))
  end

  test "should show operatingsystem" do
    get :show, id: @operatingsystem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operatingsystem
    assert_response :success
  end

  test "should update operatingsystem" do
    put :update, id: @operatingsystem, operatingsystem: { name: @operatingsystem.name }
    assert_redirected_to operatingsystem_path(assigns(:operatingsystem))
  end

  test "should destroy operatingsystem" do
    assert_difference('Operatingsystem.count', -1) do
      delete :destroy, id: @operatingsystem
    end

    assert_redirected_to operatingsystems_path
  end
end
