class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]


  def index
    @items = Item.all
    @admin = admin?
  end

  def show
    @item = Item.find(params[:id])
    @admin = admin?
  end

  def search
    @item = Item.find_by_title(params[:name])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to market_path
    else
      @error_message = 'There is problem with creating a new item'
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to controller: 'items', action: 'index'
  end


  def admin?
    true
  end

  private

  def item_params
    if params[:title].nil?
      params.require(:item).permit(:title, :body, :price)
    else
      params.permit(:title, :body, :price)
    end
  end
end
