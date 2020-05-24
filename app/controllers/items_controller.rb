class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    # @item = Item.find(params[:id])
  end

  def edit
  end

  def create
  end

  def new
    # @item = Item.new
  end

  def confirm
  end
end
