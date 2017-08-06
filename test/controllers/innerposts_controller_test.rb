require 'test_helper'

class InnerpostsControllerTest < ActionController::TestCase
  setup do
    @innerpost = innerposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:innerposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create innerpost" do
    assert_difference('Innerpost.count') do
      post :create, innerpost: { content: @innerpost.content, post_id: @innerpost.post_id, title: @innerpost.title }
    end

    assert_redirected_to innerpost_path(assigns(:innerpost))
  end

  test "should show innerpost" do
    get :show, id: @innerpost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @innerpost
    assert_response :success
  end

  test "should update innerpost" do
    patch :update, id: @innerpost, innerpost: { content: @innerpost.content, post_id: @innerpost.post_id, title: @innerpost.title }
    assert_redirected_to innerpost_path(assigns(:innerpost))
  end

  test "should destroy innerpost" do
    assert_difference('Innerpost.count', -1) do
      delete :destroy, id: @innerpost
    end

    assert_redirected_to innerposts_path
  end
end
