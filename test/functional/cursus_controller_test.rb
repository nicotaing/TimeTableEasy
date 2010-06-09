require 'test_helper'

class CursusControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cursus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cursus" do
    assert_difference('Cursus.count') do
      post :create, :cursus => { }
    end

    assert_redirected_to cursus_path(assigns(:cursus))
  end

  test "should show cursus" do
    get :show, :id => cursus(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cursus(:one).to_param
    assert_response :success
  end

  test "should update cursus" do
    put :update, :id => cursus(:one).to_param, :cursus => { }
    assert_redirected_to cursus_path(assigns(:cursus))
  end

  test "should destroy cursus" do
    assert_difference('Cursus.count', -1) do
      delete :destroy, :id => cursus(:one).to_param
    end

    assert_redirected_to cursus_path
  end
end
