require 'test_helper'

class JcloudnamesControllerTest < ActionController::TestCase
  setup do
    @jcloudname = jcloudnames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jcloudnames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jcloudname" do
    assert_difference('Jcloudname.count') do
      post :create, jcloudname: { locationname: @jcloudname.locationname, providername: @jcloudname.providername }
    end

    assert_redirected_to jcloudname_path(assigns(:jcloudname))
  end

  test "should show jcloudname" do
    get :show, id: @jcloudname
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jcloudname
    assert_response :success
  end

  test "should update jcloudname" do
    put :update, id: @jcloudname, jcloudname: { locationname: @jcloudname.locationname, providername: @jcloudname.providername }
    assert_redirected_to jcloudname_path(assigns(:jcloudname))
  end

  test "should destroy jcloudname" do
    assert_difference('Jcloudname.count', -1) do
      delete :destroy, id: @jcloudname
    end

    assert_redirected_to jcloudnames_path
  end
end
