class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaireDetail = Questionnairedetail.where(questionnaire_id: @questionnaire.id)
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
    @question_answers = QuestionAnswer.all
  end

  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create

    @questionnaire = Questionnaire.new
    if @questionnaire.save
      @questionnaire.title="Test "+@questionnaire.id.to_s
      @questionnaire.save
      params.each do |param,answerUser|
        if param.index("input")
          arr=param.split('_')
          if arr.length.to_i > 0
            questionid=arr[1]
            @questionnaireDetail= Questionnairedetail.new
            @questionnaireDetail.answerUser=answerUser
            @questionnaireDetail.idquestion=questionid.to_i
            @questionnaireDetail.eval=eval(questionid,answerUser)
            @questionnaireDetail.questionnaire_id=@questionnaire.id
            @questionnaireDetail.save
          end
        end
      end
    end

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def eval(questionid,answerUser)
    @question_answer = QuestionAnswer.find(questionid)
    if @question_answer.answer.index(answerUser)
      return '<span style="color:green;">CORRECT</span>'
    else
      return '<span style="color:red;">INCORRECT</span>'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      #@questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      #params.require(:questionnaire).permit(:answerUser, :eval, :idquestion)
    end
end
