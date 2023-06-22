# アプリケーション名

therapistalk

# アプリケーション概要
患者様の悩み相談に対し、リハビリスタッフ（セラピスト）がコメントをつけることで悩み解決が可能になる。

# URL
https://therapistalk.onrender.com

# テスト用アカウント

* Basic認証パスワード:2222
* Basic認証ID:admin
* メールアドレス:aaa@aaa.com
* パスワード:111aaa

# 利用方法
## 相談投稿
1. トップページ上部に登録ボタンとログインボタンがある。登録ボタンから新規登録をおこなう。
2. ログイン後の画面で上部にマイページボタンとログアウトボタンがある。<br>新規投稿はマイページに遷移し、右上部の投稿ボタンからおこなう。
3. 新規登録したユーザー情報を編集したい時はマイページプロフィール部の編集ボタンから行うことができる。
4. 投稿後はマイページに遷移する。
5. 投稿編集・削除はマイページに表示のある相談のタイトルのクリックで投稿詳細画面へ移動し、投稿内容下部のボタンで行う。

## コメント機能
1. トップページにログインし、あらゆる人の投稿が表示されるようになっている。<br>投稿のタイトルをクリックすると投稿詳細画面へ遷移する。<br>ログインしないとコメントフォームがでない仕組みとなっている。
2. 投稿詳細画面下部のコメントフォームからコメント投稿可能。
3. コメントを投稿すると同じ画面に戻り、最下部のコメント一覧に反映される。

# アプリケーションを作成した背景・工夫したポイント
## 背景
前職の理学療法士時代に、在宅復帰後のセルフケアに悩む方からの意見をもらうことが多かった。また退院後にセルフケアや環境調整がうまくできずに再入院される方も多かった。<br><br>現状で訪問リハビリ、外来リハビリ、デイサービスなど様々なサービスは普及しているがオフラインのものばかりである。<br>情勢やアクセスのしやすさを考慮し、オンラインでいつでも悩みを投稿し、セラピストが回答できる媒体の必要性があると感じた。<br><br>そこで、その先駆けとして、まずは簡易的な機能から作成することとした。

## 工夫
①デザイン性：清潔感や信頼という意味で青・緑を基調としたものに。<br>②フォント：繊細さをイメージし明朝体をメインに使用<br>③装飾：手（手技、手の温もり）、自然（和やかさ）<br>④レイアウト：視線の動きを意識し、Z型の設計に。<br>⑤相談の書き方に迷う方のために参考を記載<br><br>実装期間は1週間ほどであったため、自分が理想とする形にするためには多くの実装が必要であると感じている。<br><br>将来的には、相談者がコメントをくれたセラピストにいいね・フォローをして、１対１でのライブチャットができ、いつでもどこでも相談解決ができるものにする予定である。

# 洗い出した条件
https://docs.google.com/spreadsheets/d/1cBq4ZxmozUnHV9XrrtMi1BdTtqRNw3uMDqPh_AbQqEM/edit#gid=49750708


# 実装した機能についての画像やGIFおよびその説明
ログイン機能<br>![therapistalk_1ログイン機能](https://github.com/natsuko-shibayama/therapistalk/assets/124324097/129da5af-a758-48f1-bc88-76ebc0732047)
<br>ユーザー情報編集機能<br>![therapistalk_2ユーザー情報編集機能](https://github.com/natsuko-shibayama/therapistalk/assets/124324097/a33298c4-1008-4694-a1d7-fe55f7687b94)<br>相談投稿機能<br>![therapistalk_3相談投稿機能](https://github.com/natsuko-shibayama/therapistalk/assets/124324097/5a3f3170-62d5-48de-b4fd-407275b8de5d)<br>投稿内容編集機能<br>![therapistalk_4投稿内容編集機能](https://github.com/natsuko-shibayama/therapistalk/assets/124324097/761734ee-02de-419e-ac7a-cde8cf88faf9)<br>コメント投稿機能<br>![therapistalk_5コメント投稿機能](https://github.com/natsuko-shibayama/therapistalk/assets/124324097/60103e50-f4bb-452b-b0af-2e250c7f1b83)



# 実装予定の機能
* コメントをしたセラピストへのいいね、フォロー機能
* 相談者とセラピストのユーザー登録を分ける（プルダウン）機能
* 相談者、セラピスト共に職業を選択できる（プルダウン）機能
* 相談者とセラピストが１対１でライブチャットをできる機能

# データベース設計
![therapistalk](https://github.com/natsuko-shibayama/therapistalk/assets/124324097/a7475861-1ea7-4b3d-ad72-aaa661de75a6)


# 画面遷移図

![スクリーンショット 2023-06-20 16 48 26](https://github.com/natsuko-shibayama/therapistalk/assets/124324097/5205826f-7cba-4cff-9236-3db34a76c131)


# 開発環境
* フロントエンド
* バックエンド
* インフラ
* テキストエディタ
* タスク管理
* テスト


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

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------- |
| user    | references | null: false , foreign_key: true |
| talk    | references | null: false , foreign_key: true |
| comment | text       | null: false                     |

### Association

- belongs_to :user
- belongs_to :talk