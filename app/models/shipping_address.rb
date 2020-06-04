class ShippingAddress < ApplicationRecord

  validates :family_name,
  presence: true,                     # 必須
  format: { with: /\A[ぁ-んァ-ン一-龥]/ } 

  validates :first_name,
  presence: true,
  format: { with: /\A[ぁ-んァ-ン一-龥]/ } 

  validates :family_name_kana,
  presence: true,
  format: { with: /\A[ァ-ヶー－]+\z/ } 

  validates :first_name_kana,
  presence: true,
  format: { with: /\A[ァ-ヶー－]+\z/ }
  
  validates :zip_code,
  presence: true,
  format: { with: /\A[0-9]+\z/ }

  validates :prefecuture,
  presence: true,
  format: { with: /\A[ぁ-んァ-ン一-龥]/ } 

  validates :city,
  presence: true,
  format: { with: /\A[ぁ-んァ-ン一-龥]/ } 

  validates :telephone_number,
  format: { with: /\A[0-9]+\z/ },
  allow_blank: true

  belongs_to :user
end
