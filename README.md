# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many :orders
- has_many :comments


## admin_users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| company_name       | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many :performances


## performances テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| theater            | string     | null: false                    |
| start_day          | date       | null: false                    |
| last_day           | date       | null: false                    |
| info               | integer    | null: false                    |
| price              | integer    | null: false                    |
| admin_user         | references | null: false, foreign_key: true |


### Association

- belongs_to :admin_user
- has_many   :comments
- has_one    :order 
- has_many   :schedule


## schedules テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| performance_day    | date       | null: false                    |
| performance_time   | time       | null: false                    |
| stock              | integer    | null: false                    |
| performance        | references | null: false, foreign_key: true |


### Association

- belongs_to :performance
- has_one    :order 


## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| performance        | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| schedule           | references | null: false, foreign_key: true |
| buy_count          | integer    | null: false                    |


### Association

- belongs_to :user
- belongs_to :schedule
- belongs_to :performance


## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| performance        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :performance