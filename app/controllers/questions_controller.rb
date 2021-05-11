class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]


  def index
    @questions = Question.all
    @admin = admin?
  end

  def show
    @question = Question.find(params[:id])
    @admin = admin?
  end

  def search
    @question = Question.find_by_title(params[:name])
    @question.title = '123'
    @question.save
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path
    else
      @notice = 'There is problem with creating a new question'
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to controller: 'questions', action: 'index'
  end


  def admin?
    true
  end

  private

  def question_params
    if params[:title].nil?
      params.require(:question).permit(:title, :body, :answer, :payment)
    else
      params.permit(:title, :body, :answer, :payment)
    end
  end
end
