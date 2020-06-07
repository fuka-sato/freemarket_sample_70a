class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :discription, null: false
      t.references :item_image, null: false, foreign_key: true
      t.references :buyer, foreign_key: { to_table: :users }, null: false
      t.references :seller, foreign_key: { to_table: :users }, null: false
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.references :delivery_price, null: false, foreign_key: true
      t.references :delivery_area, null: false, foreign_key: true
      t.references :delivery_day, null: false, foreign_key: true
      t.integer :price, null: false
      t.timestamps
    end
  end
end