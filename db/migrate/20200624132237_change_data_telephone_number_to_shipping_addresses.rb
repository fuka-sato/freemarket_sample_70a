class ChangeDataTelephoneNumberToShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :shipping_addresses, :telephone_number, :string
  end
end
