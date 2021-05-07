class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :search]


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def search
    @article = Article.find_by_title(params[:name])
  end

end
