require 'test_helper'

class RateelemsControllerTest < ActionController::TestCase
  setup do
    @rateelem = rateelems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rateelems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rateelem" do
    assert_difference('Rateelem.count') do
      post :create, rateelem: { item: @rateelem.item, period_hour: @rateelem.period_hour, price_period: @rateelem.price_period }
    end

    assert_redirected_to rateelem_path(assigns(:rateelem))
  end

  test "should show rateelem" do
    get :show, id: @rateelem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rateelem
    assert_response :success
  end

  test "should update rateelem" do
    put :update, id: @rateelem, rateelem: { item: @rateelem.item, period_hour: @rateelem.period_hour, price_period: @rateelem.price_period }
    assert_redirected_to rateelem_path(assigns(:rateelem))
  end

  test "should destroy rateelem" do
    assert_difference('Rateelem.count', -1) do
      delete :destroy, id: @rateelem
    end

    assert_redirected_to rateelems_path
  end
end
