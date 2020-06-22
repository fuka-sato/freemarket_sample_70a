class ItemsController < ApplicationController
    def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def confirm
  end

  def new
    # 商品出品関連
    if user_signed_in?
      @item = Item.new
      @item.item_images.build
      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
    else
      redirect_to onestep_users_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  root_path and return
    else
      render :new and return
    end 
  end


  def get_category_children
  @category_children = Category.find("#{params[:parent_name]}").children
  end
  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
  @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  

  def edit
    @item = Item.find_by(id: params[:id])
  end


  def update
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path, notice: ''
  else
    #updateを失敗すると編集ページへ
    render 'edit'
  end
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
      :brand_id,
      :item_images_attributes => [:item_image,:_destroy]
    ).merge(seller_id: current_user.id)
  end
end
