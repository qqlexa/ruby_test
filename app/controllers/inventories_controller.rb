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

  def admin?
    true
  end
end
