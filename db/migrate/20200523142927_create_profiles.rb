class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :family_name, null: false
      t.string :first_name, null: false      
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.date :birth_day, null: false
      t.timestamps
    end
  end
end
