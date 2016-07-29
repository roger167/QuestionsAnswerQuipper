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
    @questionnaire = Questionnaire.where(questionnairesnumber: params[:id])
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
    arrayAnswer = Array.new
    params.each do |param,answerUser|
      if param.index("input")
        arr=param.split('_')
        questionid=arr[1]
        arrayAnswer.push(questionid.to_s+'_'+answerUser+'_'+eval(questionid,answerUser))
      end
    end

    if arrayAnswer.length.to_i > 0
      @questionnaire = Questionnaire.new
      @questionnaire.save
      @idquestionnaire=@questionnaire.id
      arrayAnswer.each do |val|
        arr= val.split('_')
        @questionnaire.idquestion=arr[0].to_i
        @questionnaire.answerUser=arr[1]
        @questionnaire.eval=arr[2]
        @questionnaire.questionnairesnumber=@idquestionnaire
        @questionnaire.save
        @questionnaire = Questionnaire.new
      end
    end

    #respond_to do |format|
      @questionnaire = Questionnaire.where(questionnairesnumber: @idquestionnaire.to_i)
      @question_answers = QuestionAnswer.all
      #if @questionnaire.save
        #format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        #format.json { render :show, status: :created, location: @questionnaire }
      #else
       # format.html { render :new }
        #format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      #end
    #end
    redirect_to :action => "index"
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
      return 'CORRECT'
    else
      return 'INCORRECT'
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
