class ItemsController < ApplicationController
  def index
    #@items = Item.all
  end
  
  def show
    # @item = Item.find(params[:id])
  end

  def new
    # 商品出品関連
    if user_signed_in?
      @item = Item.new
      @item.build_brand
      @item.item_images.build

      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
      end

    else
      redirect_to root_path
    end
    
    
  end

  def create
    @item = Item.create(item_params)
    if
    @item.save
    redirect_to  root_path and return
    else
      render :new return
  end

  def edit
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

  def confirm
  end

  private
  def item_params
    params.require(:item).permit(
      :name, 
      :discription,
      :category_id,
      :size_id,
      :condition_id,
      :delivery_price_id,
      :delivery_area_id,
      :delivery_day_id,
      :price,
      :brand_attributes =>[:id, :brand],
      :item_images_attributes =>[:id, :item_image]
    ).merge(seller_id: current_user.id)
  end

end
