class ItemImage < ApplicationRecord
  mount_uploader :item_image, ItemImageUploader
  belongs_to :item,optional: true


end
