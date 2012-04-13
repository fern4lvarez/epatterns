require 'test_helper'

class LineWorksControllerTest < ActionController::TestCase
  setup do
    @line_work = line_works(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_works)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_work" do
    assert_difference('LineWork.count') do
      post :create, :pattern_id => patterns(:ethnic).id
    end

    assert_redirected_to portfolio_path(assigns(:line_work).portfolio)
  end

  test "should show line_work" do
    get :show, id: @line_work
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_work
    assert_response :success
  end

  test "should update line_work" do
    put :update, id: @line_work, line_work: @line_work.attributes
    assert_redirected_to line_work_path(assigns(:line_work))
  end

  test "should destroy line_work" do
    assert_difference('LineWork.count', -1) do
      delete :destroy, id: @line_work
    end

    assert_redirected_to line_works_path
  end
end
