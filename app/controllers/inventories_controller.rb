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

  def update
    @inventory = Inventory.find(params[:id])
    @inventory.update(inventory_params)
    @inventory.save
    redirect_to market_path
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to controller: 'inventories', action: 'index'
  end

  def admin?
    true
  end

  private

  def inventory_params
    if params[:title].nil?
      params.require(:inventory).permit(:title, :body, :price)
    else
      params.permit(:title, :body, :price)
    end
  end
end
