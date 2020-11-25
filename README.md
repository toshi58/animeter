# テーブル設計

## usersテーブル
| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |

### Association

- has_many :likes
- has_many :watches
- has_many :wants
- has_many :reviews
- has_many :comments

## animesテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| furigana | string | null: false |
| summary  | text   | null: false |

### Association

- has_many :likes
- has_many :watches
- has_many :wants
- has_many :reviews

## likesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| anime  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :anime

## watchsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| anime  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :anime

## wantsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| anime  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :anime

## reviewsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| anime  | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :anime

## commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| review | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :review