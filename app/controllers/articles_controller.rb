class ArticlesController < ApplicationController
  # before_action :authenticate_user!, :except => [:show, :index]
  skip_before_action :authenticate_user!, :only => [:index, :edit, :search]


  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    # redirect_to :new_user_session_path, notice: "Book not found"
    @article = Article.find(params[:name])
    # {"key": "value"}
  end

  def search
    @article = Article.find_by_title(params[:name])
  end

end
