class QuestionnairedetailsController < ApplicationController
  before_action :set_questionnairedetail, only: [:show, :edit, :update, :destroy]

  # GET /questionnairedetails
  # GET /questionnairedetails.json
  def index
    @questionnairedetails = Questionnairedetail.all
  end

  # GET /questionnairedetails/1
  # GET /questionnairedetails/1.json
  def show
  end

  # GET /questionnairedetails/new
  def new
    @questionnairedetail = Questionnairedetail.new
  end

  # GET /questionnairedetails/1/edit
  def edit
  end

  # POST /questionnairedetails
  # POST /questionnairedetails.json
  def create
    @questionnairedetail = Questionnairedetail.new(questionnairedetail_params)

    respond_to do |format|
      if @questionnairedetail.save
        format.html { redirect_to @questionnairedetail, notice: 'Questionnairedetail was successfully created.' }
        format.json { render :show, status: :created, location: @questionnairedetail }
      else
        format.html { render :new }
        format.json { render json: @questionnairedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnairedetails/1
  # PATCH/PUT /questionnairedetails/1.json
  def update
    respond_to do |format|
      if @questionnairedetail.update(questionnairedetail_params)
        format.html { redirect_to @questionnairedetail, notice: 'Questionnairedetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnairedetail }
      else
        format.html { render :edit }
        format.json { render json: @questionnairedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnairedetails/1
  # DELETE /questionnairedetails/1.json
  def destroy
    @questionnairedetail.destroy
    respond_to do |format|
      format.html { redirect_to questionnairedetails_url, notice: 'Questionnairedetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnairedetail
      @questionnairedetail = Questionnairedetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnairedetail_params
      params.require(:questionnairedetail).permit(:answerUser, :eval, :idquestion, :questionnaire_id)
    end
end
