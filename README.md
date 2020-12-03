# Animeter

## アプリケーション概要
お気に入りのアニメ、見たアニメ、見たいと思っているアニメを登録できます。
また、アニメに対してレビューを投稿することができ、それにコメントする形でユーザー同士で交流することができます。

## URL
http://54.250.36.219/

## BASIC認証
ユーザー名:admin

パスワード:2222

## テスト用アカウント
email:test@test

password:test123aaa

## 利用方法
1. テスト用アカウントでログインまたはユーザー新規登録を行います。
2. ヘッダーの検索欄からアニメを検索するか、トップページのアニメランキングからアニメを選んで、アニメ詳細ページへ移動します。
3. アニメ詳細ページではお気に入り登録をしたり、「見た」や「見たい」に登録することができ、登録したアニメは自身のマイページで確認できます。
4. アニメ詳細ページではそのアニメに対して、レビューをかくことができたり、レビューにコメントをすることができ、他のユーザーと交流することができます。

## 目指した課題解決
好きな作品について他人と共有したいと思ったときに、自分と相手が共通して見てる作品や、好きな作品をすぐに知ることができれば、アニメについての会話が広がりやすいと考えました。
また、同じ作品が好きな人と気軽に交流できる場があればいいなと思いました。
ペルソナはアニメが好きな10代~30代です。

## 機能一覧
- ユーザー登録機能(新規登録、ログイン、ログアウト)
- アニメランキング機能
- アニメ登録機能(お気に入り、見た、見たい)
- レビュー機能(投稿、削除)
- コメント機能(レビューに対して)
- アニメ検索機能

## テーブル設計

![er](https://user-images.githubusercontent.com/60538998/100959277-4a533900-3561-11eb-8ea0-e4f8d85ab3e5.png)

### usersテーブル
| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |

#### Association

- has_many :likes
- has_many :watches
- has_many :wants
- has_many :reviews
- has_many :comments

### animesテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| furigana | string | null: false |
| summary  | text   | null: false |

#### Association

- has_many :likes
- has_many :watches
- has_many :wants
- has_many :reviews

### likesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| anime  | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :anime

### watchsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| anime  | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :anime

### wantsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| anime  | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :anime

### reviewsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| anime  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :anime

### commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| review | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :review