require 'test_helper'

class CursusesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cursuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cursuse" do
    assert_difference('Cursuse.count') do
      post :create, :cursuse => { }
    end

    assert_redirected_to cursuse_path(assigns(:cursuse))
  end

  test "should show cursuse" do
    get :show, :id => cursuses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cursuses(:one).to_param
    assert_response :success
  end

  test "should update cursuse" do
    put :update, :id => cursuses(:one).to_param, :cursuse => { }
    assert_redirected_to cursuse_path(assigns(:cursuse))
  end

  test "should destroy cursuse" do
    assert_difference('Cursuse.count', -1) do
      delete :destroy, :id => cursuses(:one).to_param
    end

    assert_redirected_to cursuses_path
  end
end
