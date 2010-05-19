require 'test_helper'

class SampleTasksControllerTest < ActionController::TestCase
  setup do
    @sample_task = sample_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sample_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sample_task" do
    assert_difference('SampleTask.count') do
      post :create, :sample_task => @sample_task.attributes
    end

    assert_redirected_to sample_task_path(assigns(:sample_task))
  end

  test "should show sample_task" do
    get :show, :id => @sample_task.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sample_task.to_param
    assert_response :success
  end

  test "should update sample_task" do
    put :update, :id => @sample_task.to_param, :sample_task => @sample_task.attributes
    assert_redirected_to sample_task_path(assigns(:sample_task))
  end

  test "should destroy sample_task" do
    assert_difference('SampleTask.count', -1) do
      delete :destroy, :id => @sample_task.to_param
    end

    assert_redirected_to sample_tasks_path
  end
end
