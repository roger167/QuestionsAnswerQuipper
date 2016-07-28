class QuestionsAndAnwersController < ApplicationController
  # GET /questions_and_anwers
  # GET /questions_and_anwers.json
  def index
    @questions_and_anwers = QuestionsAndAnwer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions_and_anwers }
    end
  end

  # GET /questions_and_anwers/1
  # GET /questions_and_anwers/1.json
  def show
    @questions_and_anwer = QuestionsAndAnwer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questions_and_anwer }
    end
  end

  # GET /questions_and_anwers/new
  # GET /questions_and_anwers/new.json
  def new
    @questions_and_anwer = QuestionsAndAnwer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questions_and_anwer }
    end
  end

  # GET /questions_and_anwers/1/edit
  def edit
    @questions_and_anwer = QuestionsAndAnwer.find(params[:id])
  end

  # POST /questions_and_anwers
  # POST /questions_and_anwers.json
  def create
    @questions_and_anwer = QuestionsAndAnwer.new(params[:questions_and_anwer])

    respond_to do |format|
      if @questions_and_anwer.save
        format.html { redirect_to @questions_and_anwer, notice: 'Questions and anwer was successfully created.' }
        format.json { render json: @questions_and_anwer, status: :created, location: @questions_and_anwer }
      else
        format.html { render action: "new" }
        format.json { render json: @questions_and_anwer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions_and_anwers/1
  # PUT /questions_and_anwers/1.json
  def update
    @questions_and_anwer = QuestionsAndAnwer.find(params[:id])

    respond_to do |format|
      if @questions_and_anwer.update_attributes(params[:questions_and_anwer])
        format.html { redirect_to @questions_and_anwer, notice: 'Questions and anwer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questions_and_anwer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions_and_anwers/1
  # DELETE /questions_and_anwers/1.json
  def destroy
    @questions_and_anwer = QuestionsAndAnwer.find(params[:id])
    @questions_and_anwer.destroy

    respond_to do |format|
      format.html { redirect_to questions_and_anwers_url }
      format.json { head :no_content }
    end
  end
end
