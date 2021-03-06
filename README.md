# README

## アプリケーション名
- Voting.me

## 開発環境
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- database MySQL
- Docker

## アプリケーション概要
- 投票システムを用いてユーザーが今悩んでいること、決めかねていることについて第三者の意見を仰ぐことができるアプリケーションです。選択肢を複数投稿し、閲覧者が選択肢に対して投票を行い判断のあと押しをしてくれます。

## URL
- http://3.114.239.117
  - basic認証 (username: ryutaro, password: 0823)

## 利用方法
- ユーザー登録をお願いします。
  - サンプルユーザーをご用意しております。下記内容にてログイン下さい。
    - Email: user1@gmail.com
    - password: user1user1
- トップページにお題一覧があります。ハートマークをクリックすると投票完了です。
- 画面右上の「投票を決めよう」から投稿画面に移動し、お題と投票して欲しい項目を決めます。
- 投稿完了したらトップページに遷移し、投稿内容が反映されています。

## 課題
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

## こだわったポイント
- 投票ボタンのリアルタイム更新(UXの向上)
  - 投票システム上、多重投票を避けるためユーザーが過去に投票済みのお題に対して再度投票した場合、過去の投票を削除し、最新の投票のみデータベースに登録する機能を実装しました。加えてjavascriptの非同期通信で投票ボタンクリック時にリアルタイムで投票数が変動する仕組みにしました。
  ![demo](https://gyazo.com/748b2a838780a78497afb15f82ad4d08/raw)
- AWSでのデプロイ
  - 利用者が増加した場合を想定し、学習も兼ねて簡易的なデプロイ方法ではなく大規模サービスで多く使用されているデプロイ方法を採用しました。
- Dockerを用いた環境開発構築
  - 環境差異の影響を無くす為、またDocker学習を兼ねてローカル環境の構築手段として導入いたしました。


## DB設計
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
