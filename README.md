# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -----------------------  |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birth_date         | date   | null: false              |

### Association

- has_many :purchases
- has_many :items




## items テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| item_name    | string    | null: false                    |
| description  | text      | null: false                    |
| category_id  | integer   | null: false                    |
| condition_id | integer   | null: false                    |
| charge_id    | integer   | null: false                    |
| area_id      | integer   | null: false                    |
| ship_date_id | integer   | null: false                    |
| price        | integer   | null: false                    |
| sold_status  | boolean   | null: false                    |
| user         | references| null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :users




## purchases テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| user      | references| null: false, foreign_key: true |
| item      | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| postal_code      | string    | null: false                    |
| area_id          | integer   | null: false                    |
| municipalities   | string    | null: false                    |
| house_number     | string    | null: false                    |
| building_name    | string    |                                |
| phone_number     | string    | null: false                    |
| purchase         | references| null: false, foreign_key: true |


### Association

- belongs_to :purchase