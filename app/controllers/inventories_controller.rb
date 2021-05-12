class InventoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]

  def index
    @inventories = Inventory.where(user_id: current_user.id)
    @admin = admin?

  end

  def show
    @inventory = Inventory.find(params[:id])
    @admin = admin?
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to controller: 'inventories', action: 'index'
  end

  def admin?
    true
  end
  
end
