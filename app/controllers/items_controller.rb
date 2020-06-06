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
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
    @category_parent_array << parent.name
      end
  end

  def get_category_children
  #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
  @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
 # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
　#選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
  @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
    # @parents = Category.all.order("id ASC").limit(13)
    # @item = Item.new

    # @children = Category.where(params[:parent_ids]).children_of
    # respond_to do |format|
    #   format.html { redirect_to :root }
    #   format.json { render json: @parents}
    # end


  def confirm
  end

end
