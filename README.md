## usersテーブル

|Column              |Type    |Options      |
|--------------------|--------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth              | date   | null: false |

### Association
- has_many :items
- has_many :purchase_records



## itemsテーブル

|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_cost_id   | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| shipping_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record



## purchase_recordsテーブル
|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address




## shipping_addressesテーブル
|Column            |Type         |Options                         |
|------------------|-------------|--------------------------------|
| postal_code      | string      | null: false                    |
| shipping_area_id | integer     | null: false                    |
| municipalities   | string      | null: false                    |
| address          | string      | null: false                    |
| building_name    | string      |                                |
| phone_number     | string      | null: false                    |
| purchase_record  | references  | null: false, foreign_key: true |

### Association
- belongs_to :purchase_record