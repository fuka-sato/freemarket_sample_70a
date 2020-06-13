class Item < ApplicationRecord
  belongs_to :category
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :item_images
  belongs_to :user
  belongs_to :size
  belongs_to :brand
  belongs_to :delivery_price
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :condition
  accepts_nested_attributes_for :item_images
end
