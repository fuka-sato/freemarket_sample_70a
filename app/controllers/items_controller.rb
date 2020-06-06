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
    @parents = Category.all.order("id ASC").limit(13)
    # @item = Item.new

    # @children = Category.where(params[:parent_ids]).children_of
    # respond_to do |format|
    #   format.html { redirect_to :root }
    #   format.json { render json: @parents}
    # end

  end

  def confirm
  end

end
