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

  def edit
    @item = Item.find(params[:id])
  end

  def buy
    @item = Item.find(params[:id])
    @admin = admin?
    # Add buy system
    # User's balance should decrease, when he buys something
    # byebug
    if current_user.balance - @item.price > 0
      @inventory = Inventory.new(user_id: current_user.id, item_id: @item.id)
      if @inventory.save
        current_user.balance -= @item.price
        current_user.save
        render :buy
      else
        @alert = 'Error with buying'
      end
    else
      @alert = 'You have not balance to do this'
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.save
    redirect_to market_path
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to market_path
    else
      @notice = 'There is problem with creating a new item'
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
