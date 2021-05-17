# frozen_string_literal: true

class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index search]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
    @item = Item.find_by(title: params[:name])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.save
    redirect_to items_path
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      @notice = 'There is problem with creating a new item'
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy if @item.present?
    redirect_to controller: 'items', action: 'index'
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
