class ChangeDataDeliveryPriceToDeliveryPrices < ActiveRecord::Migration[5.2]
  def change
    change_column :delivery_prices, :delivery_price, :string
  end
end
