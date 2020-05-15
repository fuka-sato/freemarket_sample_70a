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
|user_id|integer|null :false, foreign_key: true|
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
|image|string|null :false|
|name|string|null :false|
|discription|text|null :false|
|sellar_id|integer|null :false, foreign_key: true|
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
- has_many :favorits
- has_many :comments
- belongs_to :user
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
- belongs_to :user

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
- belongs_to :user

## paymentテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null :false|
|expiration_month|integer|null :false|
|expiration_year|integer|null :false|
|security_code|integer|null :false|

### Association
- belongs_to :user

## snsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false, foreign_key: true|
|provider|string||

### Association
- belongs_to :user

## profitテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false, foreign_key: true|
|amount|integer||

### Association
-belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false, foreign_key: true|
|point|integer||

### Association
-belongs_to :user


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false, foreign_key: true|
|item_id|integer|null :false, foreign_key: true|
|comment|text||

### Association
- belongs_to :user
- belomgs_to :item

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null :false, foreign_key: true|
|item_id|integer|null :false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null :false|

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

### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string||

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
|delivery_day|integer|null :false|

### Association
- has_many :items

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null :false|

### Association
- has_many :items