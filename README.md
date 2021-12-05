# アプリケーション名
## Video Diary

# アプリケーション概要
映画・ドラマ・アニメなどの視聴記録を投稿することができるアプリケーションです。
視聴日時、評価、感想などを投稿することができます。
まだ実装ができていない機能がいくつかありますが、ご了承ください。
# URL
随時掲載予定

# テスト用アカウント
メールアドレス：test@test.com
パスワード：test12
# 利用方法
随時掲載予定
# 目指した課題解決
既存の映像作品レビュー投稿アプリやサイトには映画の記録のみでアニメやドラマなどの記録を投稿できなかったりしたため、映画・ドラマ・アニメなどの映像作品に問わず、視聴記録を残しておけるような仕様にしました。
また、レビューとなるとハードルが高く、自身の視聴した作品の記録を残したいという人のために、
気軽に投稿できるようにあくまでもDiary(日記を付ける)というような設定を作りました。
# 洗い出した要件
* ユーザー管理機能
* 視聴記録投稿機能
* 投稿検索機能
* コメント機能

# 実装機能について
1. トップページ
[![Image from Gyazo](https://i.gyazo.com/e1326957f3c6ba68a40ff64ccb82ba3a.gif)](https://gyazo.com/e1326957f3c6ba68a40ff64ccb82ba3a)
2. 投稿一覧
[![Image from Gyazo](https://i.gyazo.com/73c896be2c1779eb70a50ba689ffb5a5.gif)](https://gyazo.com/73c896be2c1779eb70a50ba689ffb5a5)
3. 新規登録
[![Image from Gyazo](https://i.gyazo.com/0cea71cc931985cc7690f24751536dee.gif)](https://gyazo.com/0cea71cc931985cc7690f24751536dee)
4. ログイン
[![Image from Gyazo](https://i.gyazo.com/b9aa16634cf9d85cce8103a82cd7d2d2.gif)](https://gyazo.com/b9aa16634cf9d85cce8103a82cd7d2d2)
5. マイページ
[![Image from Gyazo](https://i.gyazo.com/90790579226e1996b4e23d0f373a2af3.png)](https://gyazo.com/90790579226e1996b4e23d0f373a2af3)
6. マイページ編集
[![Image from Gyazo](https://i.gyazo.com/c9b0a3b33ba82908e4aee604eac277f0.gif)](https://gyazo.com/c9b0a3b33ba82908e4aee604eac277f0)
7. ログアウト
[![Image from Gyazo](https://i.gyazo.com/71190dfa92acfaf00829710cd7fb94a6.gif)](https://gyazo.com/71190dfa92acfaf00829710cd7fb94a6)
8. 視聴記録投稿
[![Image from Gyazo](https://i.gyazo.com/d2d022e0e5badb37c95cd8dfc12677b4.gif)](https://gyazo.com/d2d022e0e5badb37c95cd8dfc12677b4)
9. 視聴記録詳細
[![Image from Gyazo](https://i.gyazo.com/e9c5d169f23dd45d24a4d0958139ba1b.gif)](https://gyazo.com/e9c5d169f23dd45d24a4d0958139ba1b)
# 実装予定機能
投稿へのコメント機能
投稿検索機能
# データベース設計

# ER図
[![Image from Gyazo](https://i.gyazo.com/04b588382f18561916ba10943227b863.png)](https://gyazo.com/04b588382f18561916ba10943227b863)
# テーブル設計

## usersテーブル

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


## reviewsテーブル

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


## commentsテーブル

| Column              | Type        | Options                         |
| ------------------- | ----------- | ------------------------------- |
| content             | string      | null: false                     |
| user                | references  | null: false, foreign_key: true  |
| review              | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :review
