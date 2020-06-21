class ItemsController < ApplicationController
  def index
    #@items = Item.all
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
  end
end
