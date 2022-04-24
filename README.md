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
| date               | integer    | null: false                    |
| info               | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :admin_user
- has_many   :comments
- has_one    : order 


## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| performance        | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :performance


## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| text               | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| performance        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :performance