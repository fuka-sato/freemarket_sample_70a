class ItemsController < ApplicationController

  before_action :set_item,only: [:show, :confirm, :destroy]
  
  def index
    #@items = Item.all
  end
  
  def show
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

  

  def confirm
    @user = current_user
    @card = Creditcard.find_by(user_id: current_user.id)
    @address = ShippingAddress.find_by(user_id: current_user.id)
    @item = Item.find(params[:id])
    @buyer

    if @card.blank?
    else
      Payjp.api_key = ENV['PAYJP_ACCESS_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @default_card_information.brand

      case @card_brand
      when "Visa"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?1398199435"
      when "JCB"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?1398199435"
      when "MasterCard"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?1398199435"
      when "American Express"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?1398199435"
      when "Diners Club"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?1398199435"
      when "Discover"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/discover.svg?1398199435"
      end
    end
  end

  def payment
    @creditcard = Creditcard.where(user_id: current_user.id).first
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_ACCESS_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: Payjp::Customer.retrieve(@creditcard.customer_id),
      currency: 'jpy'
      )
      @buyer = Item.find(params[:id])
      @buyer.update(buyer_id: current_user.id)
      
      redirect_to done_items_path
  end



  

  def new
    # 商品出品関連
    if user_signed_in?
      @item = Item.new
      @item.item_images.build
      #セレクトボックスの初期値設定
      @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    else
      redirect_to onestep_users_path
    end
  end

  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to users_path and return
    else
      render :new and return
    end 
  end

  

  def edit
    @item = Item.find(params[:id])
    
    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end

  end

  

  def update
    if item_params[:item_images_attributes].nil?
      flash.now[:alert] = '更新できませんでした 【画像を１枚以上入れてください】'
      render :edit
    else
      exit_ids = []
      item_params[:item_images_attributes].each do |a,b|
        exit_ids << item_params[:item_images_attributes].dig(:"#{a}",:id).to_i
      end
      ids = ItemImage.where(item_id: params[:id]).map{|image| image.id }
      delete__db = ids - exit_ids
      ItemImage.where(id:delete__db).destroy_all
      @item.touch
      if @item.update(item_params)
        redirect_to  update_done_items_path
      else
        flash.now[:alert] = '更新できませんでした'
        render :edit
      end
    end
  end

  def update_done
    @item_update = Item.order("updated_at DESC").first
  end




  def destroy
    if @item.destroy
      redirect_to root_path, notice: '商品を削除しました'
    else
      redirect_to item_path, notice: '商品を削除できませんでした'
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

  def done
  end

  

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name, 
      :buyer_id,
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