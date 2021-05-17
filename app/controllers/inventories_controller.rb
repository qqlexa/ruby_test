# frozen_string_literal: true

class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inventories = Inventory.where(user_id: current_user.id)
    @items = []
    @inventories.each do |inventory|
      @item = Item.find(inventory.item_id)
      @items.append(@item)
    end
  end

  def show
    @inventory = Inventory.find(params[:id])

    @user = User.find(@inventory.user_id)
    @item = Item.find(@inventory.item_id)
  end

  def buy
    @item = Item.find(params[:id])

    if (current_user.balance - @item.price).positive?
      create
      @alert = 'You bought'
    else
      @alert = 'You have not balance to buy this'
    end
  end

  def create
    @inventory = Inventory.new(user_id: current_user.id, item_id: @item.id)
    if @inventory.save
      current_user.balance -= @item.price
      current_user.save
      render :buy
    else
      @alert = 'Error with buying'
    end
  end

  private

  def inventory_params
    if params[:title].nil?
      params.require(:item).permit(:title, :body, :price)
    else
      params.permit(:title, :body, :price)
    end
  end
end
