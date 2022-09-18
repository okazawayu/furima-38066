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
| category     | string    | null: false                    |
| condition    | string    | null: false                    |
| charge       | string    | null: false                    |
| area         | string    | null: false                    |
| ship_date    | date      | null: false                    |
| price        | integer   | null: false                    |
| exhibitors   | string    | null: false                    |
| sold_status  | boolean   | null: false                    |
| user         | references| null: false, foreign_key: true |
| purchase     | references| null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to :purchase




## purchases テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| user         | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :item
- has_one :shipping


## shippings テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| address          | string    | null: false                    |
| postal_code      | string    | null: false                    |
| prefectures      | string    | null: false                    |
| municipalities   | string    | null: false                    |
| house_number     | string    | null: false                    |
| building_name    | string    | null: false                    |
| phone_number     | string    | null: false                    |
| purchase         | references| null: false, foreign_key: true |


### Association

- belongs_to :purchase