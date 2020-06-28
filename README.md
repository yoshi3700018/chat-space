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
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|user_id|integer|null: false|

### Association
- has_many :chat
- has_many :chat_comments

## chatテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|datetime||
|user|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :users
- has_many :chat

## groupテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|
|group_id|integer|null: false, foreign_key: true|
|user|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :chat
- belongs_to :users

## users_groupテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :chat
- belongs_to :users