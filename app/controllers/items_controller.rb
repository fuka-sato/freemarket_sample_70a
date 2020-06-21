class ItemsController < ApplicationController
    def index
    #@items = Item.all
  end
  
  def show
    # @item = Item.find(params[:id])
  end

  def edit
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
      redirect_to root_path
    end
  end

  def confirm
    @card = Creditcard.find_by(user_id: current_user.id)
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
    
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to  root_path and return
    else
      render :new and return
    end 
  end


  def get_category_children
  @category_children = Category.find(params[:parent_name]).children
  end
  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
  @category_grandchildren = Category.find("#{params[:child_id]}").children
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
