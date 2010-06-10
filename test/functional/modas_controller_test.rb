require 'test_helper'

class ModasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moda" do
    assert_difference('Moda.count') do
      post :create, :moda => { }
    end

    assert_redirected_to moda_path(assigns(:moda))
  end

  test "should show moda" do
    get :show, :id => modas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => modas(:one).to_param
    assert_response :success
  end

  test "should update moda" do
    put :update, :id => modas(:one).to_param, :moda => { }
    assert_redirected_to moda_path(assigns(:moda))
  end

  test "should destroy moda" do
    assert_difference('Moda.count', -1) do
      delete :destroy, :id => modas(:one).to_param
    end

    assert_redirected_to modas_path
  end
end
