# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| password            | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_hurigana  | string  | null: false               |
| first_name_hurigana | string  | null: false               |
| birthday            | integer | null: false               |

### Association

- has_many :address
- has_many :item
- has_many :purchaser


## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| item_image  | image      | null: false                    |
| description | string     | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| postage     | string     | null: false                    |
| ship_date   | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchaser


## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| bilding      | string     |                                |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchaser


## purchasers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |
| purchase_date | datetime   |                                |

### Association

- belongs_to :item
- has_many   :address
