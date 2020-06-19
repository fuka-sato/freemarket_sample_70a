class UsersController < ApplicationController
  def index
  end

  def onestep
  end

  def new
  end

  def create
  end

  def delete
  end
  
  def card
    @card = Creditcard.find_by(user_id: current_user.id)
    redirect_to creditcard_path(current_user.id) if @card.present?
  end

  def logout
  end
  
end