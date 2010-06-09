require 'test_helper'

class ModalitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modalities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modality" do
    assert_difference('Modality.count') do
      post :create, :modality => { }
    end

    assert_redirected_to modality_path(assigns(:modality))
  end

  test "should show modality" do
    get :show, :id => modalities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => modalities(:one).to_param
    assert_response :success
  end

  test "should update modality" do
    put :update, :id => modalities(:one).to_param, :modality => { }
    assert_redirected_to modality_path(assigns(:modality))
  end

  test "should destroy modality" do
    assert_difference('Modality.count', -1) do
      delete :destroy, :id => modalities(:one).to_param
    end

    assert_redirected_to modalities_path
  end
end
