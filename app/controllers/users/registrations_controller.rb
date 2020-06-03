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
    render template: 'shipping_addresses/new'
    
  end

  
  def configure_sign_up_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :profile_attributes =>[:family_name, :first_name,:family_name_kana,:first_name_kana,:birth_day])
  end

  


  # @user = User.new(configure_sign_up_params)
    # binding.pry
    # unless @user.valid?
    #   flash.now[:alert] = @user.errors.full_messages
    #   render :new and return
    # end
    # session["devise.regist_data"] = {user: @user.attributes}
    # session["devise.regist_data"] = {profile: @user.profile.attributes}
    # session["devise.regist_data"][:user]["password"] = params[:user][:password]
    # @shipping_address = @user.build_shipping_address
    # render :new_shipping_address

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
