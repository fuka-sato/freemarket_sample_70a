class ItemImage < ApplicationRecord
  belongs_to :item
  mount_uploader :item_image, ItemImageUploader

end
