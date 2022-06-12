# アプリケーション名

## tickets

<br />

 # アプリケーションの概要

 観客は演劇の公演を見たくなった時に上演している作品が一目でわかり、観客同士が自由にコミュニケーションすることによって作品を盛り上げることができる。<br>
 団体は自分のマイページに作品が登録されていくことによってポートフォリオとして自分達の実績を紹介することができる。

<br />

 # URL

 https://tickets-0111.herokuapp.com/

<br />

# テスト用アカウント
・Basic認証パスワード: 1564<br>
・Basic認証ID: admin<br>
・管理者ユーザーメールアドレス:test@com<br>
・管理者ユーザーパスワード；a12345<br>
・利用者ユーザーメールアドレス；test@test<br>
・利用者ユーザーパスワード；a11111<br>

<br />

# 利用方法

## 公演の出品

・ヘッダー右側のCompany menuから管理者ユーザーの新規登録を行う。<br>
・Company menuのExhabitボタンから公演の内容（公演ビジュアル2枚、タイトル、公演日程、概要、金額）を入力し出品する。<br>
・トップページ（一覧ページ）の画像をクリックして詳細ページに遷移し、ページ下部の公演回登録フォーム（日付、開演時間、座席数）から販売する公演回を登録する。

<br />

## 公演の購入

・ヘッダーから利用者ユーザーの新規登録を行う。<br>
・トップページ（一覧ページ）の画像をクリックして詳細ページに遷移し、公演一覧から販売している公演回を選ぶ。<br>
・選択した公演回の購入ボタンをクリックし購入ページに遷移して、購入枚数を選択し購入ボタンを押す。

<br />

# アプリケーションを作成した背景

・演劇団体目線<br>
コロナ禍で公演チラシを配ることが難しくなってしまった演劇団体向けに、不特定多数に宣伝できるWebサイトはニーズがあるのではないかと考えたこと。<br>
公演を行うにあたって助成金を申請するときに、証明する必要がある団体の実績が一目でわかるポートフォリオ的なサイトがあると良いのではと考えたこと。<br>

・利用者目線<br>
特に小劇場演劇だと、web予約して当日受付現金払いが慣例でキャッシュレスも浸透していないこと。<br>
コロナ禍で対面での接触を減らす運営になっているため、これをきっかけにデジタル化を進められないかと考えたこと。<br>

以上二つの目線から、実際にアプリケーションを利用すると想定される団体側のスタッフと観客側の利用者にヒヤリングを行い作成した。

<br />

# 洗い出した要件

[要件定義シート](https://docs.google.com/spreadsheets/d/1eUxWHegXJR5vPeo7kmVPJV2nma6j5kNuGDH3bmRUAI4/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明

<br />

## Deviseを二種類導入
[![Image from Gyazo](https://i.gyazo.com/c7224149b94b214fd15af9106f7648bf.gif)](https://gyazo.com/c7224149b94b214fd15af9106f7648bf)

<br />

## 管理者ユーザーでログインした時のみ公演回の登録フォームが表示される
[![Image from Gyazo](https://i.gyazo.com/cc80df682377e9e841d34996f67d2bc3.gif)](https://gyazo.com/cc80df682377e9e841d34996f67d2bc3)

<br />

## 利用者ユーザーでログインした時のみ購入ボタンが表示される

[![Image from Gyazo](https://i.gyazo.com/83732d220c6cd31f49151b118c77ee52.gif)](https://gyazo.com/83732d220c6cd31f49151b118c77ee52)

<br />

## Javascriptを使った合計金額の表示

[![Image from Gyazo](https://i.gyazo.com/681a963b0677dab5efee9ed2484db895.gif)](https://gyazo.com/681a963b0677dab5efee9ed2484db895)

<br />

# 実装予定の機能

・レビュー機能<br>
演劇の公演は初動の売れ行きが鈍く、特に初見の団体の作品は観客側は購入のハードルが高いので、見た人のレビューを閲覧する機能をつけることによって購入を検討する材料の一つとしてもらう。

<br />

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/b61e525e3d9c9f4580002c4f00957d19.png)](https://gyazo.com/b61e525e3d9c9f4580002c4f00957d19)

<br />

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/9b884615ba4957ee8e14639c5e844cdb.png)](https://gyazo.com/9b884615ba4957ee8e14639c5e844cdb)

<br />

# 開発環境

・フロントエンド：HTML, CSS, JavaScript, Bootstrap v5.1.3<br>
・バックエンド：Ruby v2.6.5, Ruby on Rails v6.0.4<br>
・インフラ：Heroku, AWS<br>
・テスト：Rspec<br>
・テキストエディタ：VScode<br>
・タスク管理：Github

<br />

# ローカルでの動作方法

以下のコマンドを順に実行<br>
% git clone https://github.com/tickets<br>
% cd tickets<br>
% bundle install<br>
% yarn install

<br />

# 工夫したポイント

コンセプトはポータルサイトと業務アプリケーションの融合。<br>
ポータルサイトの機能としては、観客が公演ビジュアルを並べたトップページから気にいった公演を選び購入する。<br>
イメージは本屋の平積みの棚から本をジャケ買いする様に演劇の公演を買える様なサイト。<br>
既存のwebサービスは業務アプリケーションにポータルサイト機能がくっついているものが多いので、ポータルサイトがメインで業務アプリケーションの機能も備えているサイトを目指した。<br>

<br />
<br />
<br />

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
- has_many   :orders 
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
- has_many   :orders 


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