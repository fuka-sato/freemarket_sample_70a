class RenameDeliveryPricesColumnToDeliceryPrices < ActiveRecord::Migration[5.2]
  def change
    rename_column :delivery_prices, :delivery_prices, :delivery_price
  end
end
