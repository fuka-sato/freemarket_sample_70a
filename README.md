 # README

## アプリ名
freemarket_sample_70a

## アプリの概要
テックエキスパートの最終課題としてフリーマーケットアプリのクローンサイトを作成しました

## 機能一覧
・deviseを用いたユーザー新規登録、ログイン機能<br>
・facebook/googele での omniauth 認証(ローカル環境のみ)<br>
・商品出品機能（画像複数枚投稿とプレビュー機能、多階層カテゴリー機能つき）<br>
・payjpを用いた商品購入機能

## 開発状況
開発体制<br>
人数：5人<br>
アジャイル型開発（スクラム）<br>

## 使用言語
ruby 2.5.1p57<br>
Rails 5.0.7.2<br>
MySQL<br>
Haml<br>
JavaScript<br>
AWS<br>


## 接続先情報
URL http://54.168.156.249<br>
ID/Pass<br>
ID: jteam<br>
Pass: 2222<br>

### テスト用アカウント
購入者用<br>
メールアドレス: buyer@buyer.com<br>
パスワード: 1234567o<br>
<br>
購入用カード情報<br>
番号： 4242424242424242<br>
期限： 1月21年<br>
セキュリティコード：123<br>
<br>
出品者用<br>
メールアドレス名: seller@seller.com<br>
パスワード: sellerseller<br>

### 動作確認方法
・Chromeの最新版を利用してアクセスしてください。<br>
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。<br>
<br>
・テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
<br>
・確認後、ログアウト処理をお願いします。

## 担当箇所
### フロントエンド
■トップページ<br>
■ユーザー新規登録/ログインページ<br>
■ユーザーマイページ<br>

### サーバーサイド
■ユーザー新規登録/ログインとSNSのAPIを用いた新規登録、ログイン（ローカルのみ）<br>
■商品出品機能
■商品編集機能
■商品削除機能
■商品詳細表示機能


## 工夫点
①チームとして工夫を行った点<br>
できるだけ作業量に偏りが出ないよう、作業の割り振りを話し合う時間をこまめにとるようにしました。<br>
また、チームメンバーそれぞれがチーム協同での開発ということを意識し、進捗の共有と相談を積極的に行うようにしていました。
<br>
<br>
②個人として工夫を行った点<br>
他のメンバーが詰まっている部分があると共有を受けた際は、自身が解決できると明確でない場合も、<br>
「成長の機会」と捉えて率先して協力をするようにしました。<br>
また、実装が難しいと言われている部分は自身の知識の向上のために、できるだけ関わるようにしていました。

## デモ
トップページ<br>

新規登録画面<br>

出品画面<br>

商品詳細画面<br>

マイページ<br>


# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null :false|
|password|string|null :false|
|email|string|null :false|

### Association
- has_many :payments
- has_many :comments
- has_many :favorites
- has_many :items
- has_one :profile
- has_one :shipping_address
- has_one :point
- has_one :profit
- has_one :sns

## profiles
|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key: true|
|family_name|string|null :false|
|first_name|string|null :false|
|family_name_kana|string|null :false|
|first_name_kana|string|null :false|
|birth_year|integer|null :false|
|birth_month|integer|null :false|
|birth_day|integer|null :false|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|discription|text|null :false|
|seller_id|references|null :false, foreign_key: true|
|buyer_id|references|null :false, foreign_key: true|
|category_id|references|null :false, foreign_key: true|
|brand_id|references|foreign_key: true|
|size_id|references|null :false, foreign_key: true|
|condition_id|references|null :false, foreign_key: true|
|delivery_price_id|references|null :false, foreign_key: true|
|delivery_area_id|references|null :false, foreign_key: true|
|delivery_day_id|references|null :false, foreign_key: true|
|price|integer|null :false|


### Association
- has_many :favorites
- has_many :comments
- has_many :item_images
- belongs_to :user
- belongs_to :category
- belongs_to :size
- belongs_to :brand
- belongs_to :delivery_price
- belongs_to :delivery_area
- belongs_to :delivery_day
- belongs_to :condition


## shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key: true|
|family_name|string|null :false|
|first_name|string|null :false|
|family_name_kana|string|null :false|
|first_name_kana|string|null :false|
|zip_code|integer|null :false|
|prefecuture|string|null :false|
|city|string|null :false|
|address|string|null :false|
|building_name|string||
|telephone_number|integer||

### Association
- belongs_to :user

## paymentsテーブル(Pay.jp)
|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key: true|
|card_number|integer|null :false|
|expiration_month|integer|null :false|
|expiration_year|integer|null :false|
|security_code|integer|null :false|

### Association
- belongs_to :user

## snsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key: true|
|provider|string||

### Association
- belongs_to :user

## profitsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key: true|
|amount|integer||

### Association
-belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key: true|
|point|integer||

### Association
-belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key: true|
|item_id|references|null :false, foreign_key: true|
|comment|text||

### Association
- belongs_to :user
- belomgs_to :item

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null :false, foreign_key: true|
|item_id|references|null :false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null :false|
|ancestory|string|null :false|

### Association
- has_many :items

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null :false|

### Association
- has_many :items

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null :false|
|ancestory|string||

### Association
- has_many :items
- has_ancestory

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|null :false|

### Association
- has_many :items

## delivery_pricesテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_price|integer|null :false|

### Association
- has_many :items

## delivery_areasテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_area|string|null :false|

### Association
- has_many :items

## delivery_daysテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null :false|
|delivery_day|integer|null :false|

### Association
- has_many :items

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null :false|

### Association
- has_many :items

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null :false, foreign_key: true|
|item_image|string|null :false|

### Association
- has_many :items
