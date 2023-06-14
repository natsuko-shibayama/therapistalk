# アプリケーション名

therapistalk

# アプリケーション概要
患者様の悩み相談に対し、医療者がコメントをつけることで悩み解決の糸口とする。

# URL
https://therapistalk.onrender.com

# テスト用アカウント

* Basic認証パスワード:
* Basic認証ID:
* メールアドレス:
* パスワード:

# 利用方法
## 相談投稿
1. トップページ上部に登録ボタンとログインボタンがある。登録ボタンから新規登録をおこなう。
2. ログイン後の画面で上部にマイページボタンとログアウトボタンがある。新規投稿はマイページに遷移し、右上部の投稿ボタンからおこなう。
3. 新規登録した情報を編集したい時はマイページプロフィール部の編集ボタンから行うことができる。
4. 投稿後はマイページに遷移する。
5. 投稿編集・削除はマイページに表示のある相談のタイトルのクリックで投稿詳細画面へ移動し、投稿内容下部のボタンで行う。

## コメント機能
1. トップページにログインし、あらゆる人の投稿が表示されるようになっている。投稿のタイトルをクリックすると投稿詳細画面へ遷移する。
2. 投稿詳細画面下部のコメントフォームからコメント投稿可能。
3. コメント投稿しボタンをおしたら同じ画面に戻り、最下部のコメント一覧がupdateされる。

# アプリケーションを作成した背景
前職の理学療法士時代に、在宅復帰後のセルフケアに悩む方からの意見をもらったことがあった。もちろん様々なサービスは普及しているがオフラインのものばかり。オンラインでいつでも悩みを投稿し、セラピストが回答できる媒体があればと思い、その先駆けで簡易的な機能から作成することとした。

# 洗い出した条件
https://docs.google.com/spreadsheets/d/1cBq4ZxmozUnHV9XrrtMi1BdTtqRNw3uMDqPh_AbQqEM/edit#gid=49750708


# 実装した機能についての画像やGIFおよびその説明



# 実装予定の機能
* コメントをしたセラピストへのいいね、フォロー機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/cdc70417e9995cdc42de0a90602849de.png)](https://gyazo.com/cdc70417e9995cdc42de0a90602849de)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/11682ad7cb28e30050206b6ee6f18120.png)](https://gyazo.com/11682ad7cb28e30050206b6ee6f18120)


# 開発環境
* フロントエンド
* バックエンド
* インフラ
* テキストエディタ
* タスク管理
* テスト

# ローカルでの動作方法

以下のコマンドを順に実行。



# 工夫したポイント




# テーブル設計

## usersテーブル

| Column                | Type   | Options                   |
| ------------------    | ------ | ------------------------- |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| nickname              | string | null: false               |
| job                   | string | null: false               |
| description           | string | null: false               |

### Association

- has_many :talks
- has_many :comments

## talks テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| title   | text       | null: false                    |
| content | text       | null: false                    |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column | Type       | Options                         |
| ------ | ---------- | ------------------------------- |
| user   | references | null: false , foreign_key: true |
| talk   | references | null: false , foreign_key: true |
| text   | comment    | null: false                     |

### Association

- belongs_to :user
- belongs_to :talk