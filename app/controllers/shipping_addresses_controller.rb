class ShippingAddressesController < ApplicationController
  def new
    # binding.pry
    # @user = User.find(params[:user_id])
    @shipping_address = Shipping_address.new
  end
  
  def create
    # @user = User.find(params[:user_id])
    @shipping_address = Shipping_address.new(shipping_address_params)
    unless @shipping_address.valid?
      render :new
    end
    @shipping_address.save
    render :complete
  end

  def complete
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(
      :family_name, 
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :zip_code,
      :prefecuture,
      :city,
      :address,
      :building_name,
      :telephone_number).merge(user_id: current_user.id)
  end
end
