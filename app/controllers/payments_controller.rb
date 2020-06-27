class PaymentsController < ApplicationController

# [WIP]画面遷移用のクレカ登録サブページ

  require "payjp"
  before_action :set_card

  def new # カードの登録画面。送信ボタンを押すとcreateアクション
    @card = Creditcard.find_by(user_id: current_user.id)
    redirect_to payments_path(current_user.id) if @card.present?
  end


  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = ENV['PAYJP_ACCESS_KEY']

    if params["payjp-token"].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        card: params["payjp-token"], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: current_user.id}
      )
      @card = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save 
        redirect_to (request.referer) if @card.present?
        # redirect_to request.referrer if @card.present?
      else
        redirect_to action: "new"
      end
    end
  end

  def destroy #PayjpとCardデータベースを削除します
    card = Creditcard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show
    card = Creditcard.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "new"
    else
      redirect_to(request.referer) if @card.present?
    end
  end


  private

  def set_card
    @card = Creditcard.find_by(user_id: current_user.id) if Creditcard.where(user: current_user).present?
  end

  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_ACCESS_KEY]
    end
  end
end