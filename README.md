# README

## アプリケーション名
- Voting.me

## 開発環境
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- database MySQL

## アプリケーション概要
- 投票システムを用いてユーザーが今悩んでいること、決めかねていることについて第三者の意見を仰ぐことができるアプリケーションです。選択肢を複数投稿し、閲覧者が選択肢に対して投票を行い判断のあと押しをしてくれます。

## URL
- http://3.114.239.117
- - basic認証(username: ryutaro, password: 0823)

## 利用方法
- ユーザー登録をお願いします。
- - サンプルユーザーをご用意しております。下記内容にてログイン下さい。
    nickname: user1
    password: user1user1
- トップページにお題一覧があります。ハートマークをクリックすると投票完了です。
- 画面右上の「投票を決めよう」から投稿画面に移動し、お題と投票して欲しい項目を決めます。
- 投稿完了したらトップページに遷移し、投稿内容が反映されています。

### ペルソナ
- 優柔不断で決断が苦手な人
- 自分の決断に自信を持ちたい人

### 解決する課題
- 長引く悩みで精神と時間を消耗してしまうとき
- 自分の行動に自信が持てなくなってしまうとき

### なぜ解決が必要か
- 自分では決断しかねる悩みに頭を使って精神や時間を消耗してしまうことを避ける。
- 他人からの賛成があることで自分の決断が正しかったのかどうかという不安を緩和できる。

## 実装手順
- フロント実装
- ユーザー登録機能
- basic認証
- 投稿一覧機能
- 投稿機能
- 投稿編集機能
- 投稿削除機能
- 投票機能
- リアルタイム投稿数表示機能
- AWSデプロイ

##usersテーブル
|Colum|Type|Options|
|-----|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|password_confirmation|null: false|

###Association
- has_many :contents
- has_many :votes

##contentsテーブル
|Colum|Type|Options|
|-----|----|-------|
|title|string|null: false|
|user|references|null: false, foreign_key: true|

###Association
- has_many :choices, dependent: :destroy
- has_many :votes, dependent: :destroy
- belongs_to :user

##choicesテーブル
|Colum|Type|Options|
|-----|----|-------|
|text|string|null: false|
|votes_count|integer|
|content|references|null: false, foreign_key: true|

###Association
- has_many :votes, dependent: :destroy
- belongs_to :content

###votesテーブル
|Colum|Type|Options|
|-----|----|-------|
|user|references|null: false, foreign_key: true|
|content|references|null: false, foreign_key: true|
|choice|references|null: false, foreign_key: true|

###Association
- belongs_to :user
- belongs_to :content
- belongs_to :choice, counter_cache: :votes_count
