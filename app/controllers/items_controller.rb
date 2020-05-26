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
    @category_parent_array = ["---"]
    
    Category.where(ancestry: nil).each do |parent|  
    @category_parent_array << parent.name  
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children　// 子カテゴリの配列（name）
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children　　// 孫カテゴリの配列（name）
  end

  def confirm
  end
end
