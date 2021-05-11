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

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    @question.save
    redirect_to question_path
  end

  def search
    @question = Question.find_by_title(params[:name])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def solve
    @question = Question.find(params[:id])
    params[:id]

    @admin = admin?

    if @question.answer == params[:user_answer]
      render :solved
    else
      @notice = 'Answer is incorrect'
      render :show
    end

  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path @question
    else
      @notice = 'There is problem with creating a new question'
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy if @question.present?
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
