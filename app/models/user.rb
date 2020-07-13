class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

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
  has_many :creditcards
  has_many :items
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email:auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    user
  end
end


