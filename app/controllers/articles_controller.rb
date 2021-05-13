# frozen_string_literal: true

class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index search]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def search
    @article = Article.find_by(title: params[:name])
  end
end
