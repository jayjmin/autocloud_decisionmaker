require 'test_helper'

class ResourcesetsControllerTest < ActionController::TestCase
  setup do
    @resourceset = resourcesets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resourcesets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resourceset" do
    assert_difference('Resourceset.count') do
      post :create, resourceset: { cpu: @resourceset.cpu, hdd: @resourceset.hdd, iscustomizable: @resourceset.iscustomizable, name: @resourceset.name, ram: @resourceset.ram }
    end

    assert_redirected_to resourceset_path(assigns(:resourceset))
  end

  test "should show resourceset" do
    get :show, id: @resourceset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resourceset
    assert_response :success
  end

  test "should update resourceset" do
    put :update, id: @resourceset, resourceset: { cpu: @resourceset.cpu, hdd: @resourceset.hdd, iscustomizable: @resourceset.iscustomizable, name: @resourceset.name, ram: @resourceset.ram }
    assert_redirected_to resourceset_path(assigns(:resourceset))
  end

  test "should destroy resourceset" do
    assert_difference('Resourceset.count', -1) do
      delete :destroy, id: @resourceset
    end

    assert_redirected_to resourcesets_path
  end
end
