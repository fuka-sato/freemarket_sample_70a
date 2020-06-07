class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates_confirmation_of :password  
  attr_accessor :password_confirmation 

  validates :nickname,
  presence: true,                     # 必須
  uniqueness: true,                   # 一意性
  length: { maximum: 20 }            # あんまり長いのも

  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }  # メールアドレスの正規表現

  validates :password,
  presence: true,                     # 必須
  length: { minimum: 7 },            # 7文字以上
  format: { with: /\A[a-z0-9]+\z/i }  # 半角英数字のみ

  has_one :profile
  has_one :shipping_address
  accepts_nested_attributes_for :profile
  has_many :items
end


