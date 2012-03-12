require 'test_helper'

class MetaitemsControllerTest < ActionController::TestCase
  setup do
    @metaitem = metaitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metaitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metaitem" do
    assert_difference('Metaitem.count') do
      post :create, metaitem: @metaitem.attributes
    end

    assert_redirected_to metaitem_path(assigns(:metaitem))
  end

  test "should show metaitem" do
    get :show, id: @metaitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metaitem
    assert_response :success
  end

  test "should update metaitem" do
    put :update, id: @metaitem, metaitem: @metaitem.attributes
    assert_redirected_to metaitem_path(assigns(:metaitem))
  end

  test "should destroy metaitem" do
    assert_difference('Metaitem.count', -1) do
      delete :destroy, id: @metaitem
    end

    assert_redirected_to metaitems_path
  end
end
