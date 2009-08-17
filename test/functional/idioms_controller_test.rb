require 'test_helper'

class IdiomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:idioms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create idiom" do
    assert_difference('Idiom.count') do
      post :create, :idiom => { }
    end

    assert_redirected_to idiom_path(assigns(:idiom))
  end

  test "should show idiom" do
    get :show, :id => idioms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => idioms(:one).to_param
    assert_response :success
  end

  test "should update idiom" do
    put :update, :id => idioms(:one).to_param, :idiom => { }
    assert_redirected_to idiom_path(assigns(:idiom))
  end

  test "should destroy idiom" do
    assert_difference('Idiom.count', -1) do
      delete :destroy, :id => idioms(:one).to_param
    end

    assert_redirected_to idioms_path
  end
end
