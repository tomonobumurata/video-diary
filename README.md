# テーブル設計

# usersテーブル

| Column              | Type      | Options                    |
| ------------------- | --------- | -------------------------- |
| nickname            | string    | null: false                |
| email               | string    | null: false, unique: true  |
| encrypted_password  | string    | null: false                |
| full_name           | string    | null: false                |
| full_name_kana      | string    | null: false                |
| birthday            | date      | null: false                |
| introduction        | text      |                            |

### Association
- has_many :reviews
- has_many :comments


# reviewsテーブル

| Column              | Type        | Options                         |
| ------------------- | ----------- | ------------------------------- |
| title               | string      | null: false                     |
| date                | date        |                                 |
| genre_id            | integer     | null: false                     |
| star_id             | integer     | null: false                     |
| place_id            | integer     |                                 |
| impression          | text        |                                 |
| user                | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_many :comments


# commentsテーブル

| Column              | Type        | Options                         |
| ------------------- | ----------- | ------------------------------- |
| content             | string      | null: false                     |
| user                | references  | null: false, foreign_key: true  |
| review              | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :review