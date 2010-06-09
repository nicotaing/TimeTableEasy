require 'test_helper'

class ClassesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classe" do
    assert_difference('Classe.count') do
      post :create, :classe => { }
    end

    assert_redirected_to classe_path(assigns(:classe))
  end

  test "should show classe" do
    get :show, :id => classes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => classes(:one).to_param
    assert_response :success
  end

  test "should update classe" do
    put :update, :id => classes(:one).to_param, :classe => { }
    assert_redirected_to classe_path(assigns(:classe))
  end

  test "should destroy classe" do
    assert_difference('Classe.count', -1) do
      delete :destroy, :id => classes(:one).to_param
    end

    assert_redirected_to classes_path
  end
end
