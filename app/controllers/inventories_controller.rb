class InventoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @inventories = Inventory.where(user_id: current_user.id)
    @admin = admin?
  end

  def show
    @inventory = Inventory.find(params[:id])
    @admin = admin?
  end

  def admin?
    true
  end
end
