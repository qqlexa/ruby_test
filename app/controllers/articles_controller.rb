class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :edit, :search]


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:name])
  end

  def search
    @article = Article.find_by_title(params[:name])
  end

end
