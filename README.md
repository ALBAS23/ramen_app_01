# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# Database
## ramen_app_01

## users table

| Column                   | Type               | Options                         |
|:-------------------------|-------------------:|:-------------------------------:|
| nickname                 | string             | null: false, unique: true       |
| e-mail                   | string             | null: false, unique: true       |
| encrypted-password       | string             | null: false, max_length: 8      |

### Association
- has_many :posts
- has_one :personal
- has_many :sns_credentials
- has_many :favorites
- has_many :favorite_posts, through: favorites, source: post


## people table

| Column                   | Type               | Options                         |
|:-------------------------|-------------------:|:-------------------------------:|
| gender                   | string             | null: false                     |
| prefecture_id            | integer            |                                 |
| f_store_one              | string             | null: false                     |
| f_store_two              | string             |                                 |
| f_store_three            | string             |                                 |
| genre_id                 | integer            | null: false                     |
| f_topping                | string             |                                 |
| self_introduction        | text               |                                 |
| user                     | references         | null: false, foreign_key: true  |

### Association
- belongs_to :user


## posts table

| Column                   | Type               | Options                         |
|:-------------------------|-------------------:|:-------------------------------:|
| menu                     | string             | null: false                     |
| store                    | string             | null: false                     |
| price                    | integer            | null: false                     |
| genre_id                 | integer            | null: false                     |
| word                     | string             | null: false                     |
| prefecture_id            | integer            | null: false                     |
| place                    | string             |                                 |
| user                     | references         | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_many :posts
- has_many :users, through: favorites
- has_many :favorites


## sns credentials table
| Column                   | Type               | Options                         |
|:-------------------------|-------------------:|:-------------------------------:|
| provider                 | string             |                                 |
| uid                      | string             |                                 |
| user                     | references         | foreign_key: true               |

### Association
- belongs_to :user


## favorites
| Column                   | Type               | Options                         |
|:-------------------------|-------------------:|:-------------------------------:|
| user                     | references         | null: false, foreign_key: true  |
| post                     | references         | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :post


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
