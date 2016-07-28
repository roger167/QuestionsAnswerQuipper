require 'test_helper'

class QuestionsAndAnwersControllerTest < ActionController::TestCase
  setup do
    @questions_and_anwer = questions_and_anwers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions_and_anwers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questions_and_anwer" do
    assert_difference('QuestionsAndAnwer.count') do
      post :create, questions_and_anwer: {  }
    end

    assert_redirected_to questions_and_anwer_path(assigns(:questions_and_anwer))
  end

  test "should show questions_and_anwer" do
    get :show, id: @questions_and_anwer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questions_and_anwer
    assert_response :success
  end

  test "should update questions_and_anwer" do
    put :update, id: @questions_and_anwer, questions_and_anwer: {  }
    assert_redirected_to questions_and_anwer_path(assigns(:questions_and_anwer))
  end

  test "should destroy questions_and_anwer" do
    assert_difference('QuestionsAndAnwer.count', -1) do
      delete :destroy, id: @questions_and_anwer
    end

    assert_redirected_to questions_and_anwers_path
  end
end
