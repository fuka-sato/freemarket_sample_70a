class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :nickname,
  presence: true,                     # 必須にしたい！
  uniqueness: true,                   # 一意性
  length: { maximum: 20 }            # あんまり長いのも……

  validates :email,
  presence: true,
  uniqueness: true,
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }  # メールアドレスの正規表現

  validates :encrypted_password,
  presence: true,                     # 必須にしたい！
  length: { minimum: 7 },            # 7文字以上
  format: { with: /\A[a-z0-9]+\z/i }  # やっぱり半角英数字のみだよね！

  has_one :profile
  accepts_nested_attributes_for :profile
end


