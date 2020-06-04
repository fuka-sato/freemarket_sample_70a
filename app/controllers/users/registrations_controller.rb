# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @user.build_profile
    @shipping_address = ShippingAddress.new
  end

  # POST /resource
  def create
    @user = User.new(configure_sign_up_params)
    unless @user.valid?
      render :new and return
    end
    @user.save
    sign_in(:user, @user)
    redirect_to  new_user_shipping_address_path(@user)
  end

  def configure_sign_up_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :profile_attributes =>[:family_name, :first_name,:family_name_kana,:first_name_kana,:birth_day])
  end
end
