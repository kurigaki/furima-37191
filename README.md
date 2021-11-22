## usersテーブル

|Column              |Type    |Options      |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth              | string | null: false |

### Association
- has_many :items
- has_many :purchase_record



## itemsテーブル

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| item_image         | string     | null: false                    |
| item_name          | string     | null: false                    |
| item_explanation   | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| category           | string     | null: false                    |
| Item_condition     | string     | null: false                    |
| shipping_cost      | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| shipping_time      | string     | null: false                    |
| price              | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchase_record



## purchase_recordsテーブル
|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |


### Association
- belongs_to :users
- belongs_to :items




## shipping_addressesテーブル
|Column           |Type        |Options                         |
|-----------------|------------|--------------------------------|
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| municipalities  | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

### Association
- belongs_to :purchase_record