require 'test_helper'

class QuestionnairedetailsControllerTest < ActionController::TestCase
  setup do
    @questionnairedetail = questionnairedetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionnairedetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionnairedetail" do
    assert_difference('Questionnairedetail.count') do
      post :create, questionnairedetail: { answerUser: @questionnairedetail.answerUser, eval: @questionnairedetail.eval, idquestion: @questionnairedetail.idquestion, questionnaire_id: @questionnairedetail.questionnaire_id }
    end

    assert_redirected_to questionnairedetail_path(assigns(:questionnairedetail))
  end

  test "should show questionnairedetail" do
    get :show, id: @questionnairedetail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionnairedetail
    assert_response :success
  end

  test "should update questionnairedetail" do
    patch :update, id: @questionnairedetail, questionnairedetail: { answerUser: @questionnairedetail.answerUser, eval: @questionnairedetail.eval, idquestion: @questionnairedetail.idquestion, questionnaire_id: @questionnairedetail.questionnaire_id }
    assert_redirected_to questionnairedetail_path(assigns(:questionnairedetail))
  end

  test "should destroy questionnairedetail" do
    assert_difference('Questionnairedetail.count', -1) do
      delete :destroy, id: @questionnairedetail
    end

    assert_redirected_to questionnairedetails_path
  end
end
