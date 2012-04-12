require 'test_helper'

class PatternsControllerTest < ActionController::TestCase
  setup do
    @pattern = patterns(:one)
    @update = {
      :title       => 'Pattern',  
      :description => 'Just a pattern',
      :image_url   => 'pattern.png',
      :price       => 1.23
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patterns)
    assert_select '#pattern_list tr', :minimum => 2
    assert_select 'h1', 'Listing patterns'
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pattern" do
    assert_difference('Pattern.count') do
      post :create, :pattern => @update
    end

    assert_redirected_to pattern_path(assigns(:pattern))
  end

  test "should show pattern" do
    get :show, :id => @pattern
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @pattern
    assert_response :success
  end

  test "should update pattern" do
    put :update, :id => @pattern.to_param, :pattern => @update
    assert_redirected_to pattern_path(assigns(:pattern))
  end

  test "should destroy pattern" do
    assert_difference('Pattern.count', -1) do
      delete :destroy, :id => @pattern
    end

    assert_redirected_to patterns_path
  end

end
