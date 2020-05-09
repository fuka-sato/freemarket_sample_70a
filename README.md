# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null :false|
|password|string|null :false|
|email|string|null :false|

### Association
- has_many :items, through: users_items
- has_many :payment
- has_many :comments
- has_one :favorites
- has_one :profiles
- has_one :shipping_address
- has_one :points
- has_one :profit
- has_one :sns

## profiles
|Column|Type|Options|
|------|----|-------|
|family_name|string|null :false|
|first_name|string|null :false|
|family_name_kana|string|null :false|
|first_name_kana|string|null :false|
|birth_year|integer|null :false|
|birth_manth|integer|null :false|
|birth_day|integer|null :false|

### Association
- belongs_to :users

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image_id|integer|null :false, foreign_key: true| 
|name|string|null :false|
|discription|text|null :false|
|cellar_id|integer|null :false, foreign_key: true|
|buyer_id|integer|hull :false, foreign_key: true|
|category_id|integer|null :false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|size_id|integer|foreign_key: true|
|condition_id|integer|null :false, foreign_key: true|
|delivery_price_id|integer|null :false, foreign_key: true|
|delivery_area_id|integer|null :false, foreign_key: true|
|delivery_day_id|integer|null :false, foreign_key: true|
|price|integer|null :false|

### Association
- has_many :images
- has_many :users, through: users_items
- has_many :favorits
- belongs_to :comments
- belongs_to :categorys
- belongs_to :sizes
- belongs_to :brands
- belongs_to :delivery_prices
- belongs_to :delivery_areas
- belongs_to :delivery_days
- belongs_to :conditions
- belongs_to :comments

## shipping_addressテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null :false|
|first_name|string|null :false|
|family_name_kana|string|null :false|
|first_name_kana|string|null :false|
|zip_code|integer|null :false|
|prefecutures|string|null :false|
|city|string|null :false|
|address|string|null :false|
|building_name|string||
|telephone_number|integer||

### Association
- belongs_to :users

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|users_id|integer|null :false, foreign_key: true|
|user_image|text||
|introduction|text||
|birth_year|integer|null :false|
|birth_month|integer|null :false|
|birth_day|integer|null :false|

### Association
- belongs_to :users

## paymentテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null :false|
|expiration_month|integer|null :false|
|expiration_year|integer|null :false|
|security_code|integer|null :false|

### Association
- belongs_to :users

## snsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||


### Association
- belongs_to :users

## profitテーブル
|Column|Type|Options|
|------|----|-------|
|amount|integer||

### Association
-belongs_to :users

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text||

### Association
- belongs_to :users
- belomgs_to :items

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|favorite|string||

### Association
- belongs_to :users
- belongs_to :items
