require 'test_helper'

class ServicetypesControllerTest < ActionController::TestCase
  setup do
    @servicetype = servicetypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:servicetypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create servicetype" do
    assert_difference('Servicetype.count') do
      post :create, servicetype: { contract_day: @servicetype.contract_day, isflexiblefee: @servicetype.isflexiblefee, isstable: @servicetype.isstable, stype: @servicetype.stype }
    end

    assert_redirected_to servicetype_path(assigns(:servicetype))
  end

  test "should show servicetype" do
    get :show, id: @servicetype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @servicetype
    assert_response :success
  end

  test "should update servicetype" do
    put :update, id: @servicetype, servicetype: { contract_day: @servicetype.contract_day, isflexiblefee: @servicetype.isflexiblefee, isstable: @servicetype.isstable, stype: @servicetype.stype }
    assert_redirected_to servicetype_path(assigns(:servicetype))
  end

  test "should destroy servicetype" do
    assert_difference('Servicetype.count', -1) do
      delete :destroy, id: @servicetype
    end

    assert_redirected_to servicetypes_path
  end
end
