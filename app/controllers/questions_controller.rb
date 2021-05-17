# frozen_string_literal: true

class QuestionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index search]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.find(@question.answer_id)
  end

  def update
    @answer = Answer.find_or_create_by(answer: params[:answer])
    @question = Question.find(params[:id])
    @question.update(question_params.to_h.merge({ answer_id: @answer.id }))
    @question.save
    redirect_to question_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def search
    redirect_to controller: 'questions', action: 'index'
  end

  def solve
    @question = Question.find(params[:id])
    params[:id]

    check_result
  end

  def new
    @question = Question.new
  end

  def create
    @answer = Answer.find_or_create_by(answer: params[:answer])
    @question = Question.new(question_params.to_h.merge({ answer_id: @answer.id }))
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

  private

  def question_params
    if params[:title].nil?
      params.require(:question).permit(:title, :body, :payment)
    else
      params.permit(:title, :body, :payment)
    end
  end

  def check_result
    @answer = Answer.find(@question.answer_id)
    if @answer.answer == params[:user_answer]
      current_user.balance += @question.payment
      current_user.save
      render :solved
    else
      @notice = 'Answer is incorrect'
      render :show
    end
  end
end
