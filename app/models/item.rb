class Item < ApplicationRecord
  belongs_to :category
  belongs_to :seller, class_name: "User"
  has_many :item_images,dependent: :destroy 
  belongs_to :size
  belongs_to :brand, optional: true
  belongs_to :delivery_price
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :condition
  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :item_images, presence: true
  validates :name,:discription,:category_id,:seller_id,:size_id,:condition_id,:delivery_price_id,:delivery_area_id,:delivery_day_id,:price , presence: true
end
