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
|user_id|reference|null :false, foreign_key: true|
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
|seller_id|reference|null :false, foreign_key: true|
|buyer_id|reference|hull :false, foreign_key: true|
|category_id|reference|null :false, foreign_key: true|
|brand_id|reference|foreign_key: true|
|size_id|reference|null :false, foreign_key: true|
|condition_id|reference|null :false, foreign_key: true|
|delivery_price_id|reference|null :false, foreign_key: true|
|delivery_area_id|reference|null :false, foreign_key: true|
|delivery_day_id|reference|null :false, foreign_key: true|
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
|user_id|reference|null :false, foreign_key: true|
|family_name|string|null :false|
|first_name|string|null :false|
|family_name_kana|string|null :false|
|first_name_kana|string|null :false|
|zip_code|integer|null :false|
|prefecuture|string|null :false|
|city|string|null :false|
|address|string|null :false|
|building_name|string||
|telephone_number|string||

### Association
- belongs_to :user

## paymentsテーブル(Pay.jp)
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null :false, foreign_key: true|
|card_number|integer|null :false|
|expiration_month|integer|null :false|
|expiration_year|integer|null :false|
|security_code|integer|null :false|

### Association
- belongs_to :user

## snsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null :false, foreign_key: true|
|provider|string||

### Association
- belongs_to :user

## profitsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null :false, foreign_key: true|
|amount|integer||

### Association
-belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null :false, foreign_key: true|
|point|integer||

### Association
-belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null :false, foreign_key: true|
|item_id|reference|null :false, foreign_key: true|
|comment|text||

### Association
- belongs_to :user
- belomgs_to :item

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null :false, foreign_key: true|
|item_id|reference|null :false, foreign_key: true|

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
|item_id|reference|null :false|
|delivery_price|integer|null :false|

### Association
- has_many :items

## delivery_areasテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|null :false|
|delivery_area|string|null :false|

### Association
- has_many :items

## delivery_daysテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|reference|null :false|
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
|item_id|reference|null :false, foreign_key: true|
|item_image|string|null :false|

### Association
- has_many :items
