class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :prefecture
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_one_attached :image

  with_options presence: { message: 'を必ず入力してください' } do
    validates :menu
    validates :store
    validates :price, numericality: { message: 'は半角数字で入力してください' }
    validates :word
    validates :user
  end

  validates :genre_id, numericality: { other_than: 1, message: 'は必ず入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'は必ず入力してください' }

  def self.search_price(keyword)
    if keyword.to_i < 1000
      Post.where(' price < ? ', keyword.to_i).order('price DESC')
    else
      Post.where(' price >= ? ', keyword.to_i).order('price DESC')
    end
  end

  def self.search_genre(keyword)
    Post.where(genre_id: keyword).order('created_at DESC')
  end

  def self.search_prefecture(keyword)
    Post.where(prefecture_id: keyword).order('created_at DESC')
  end

  def self.search_store(keyword)
    Post.where('store LIKE(?)', "%#{keyword}%").order('created_at DESC')
  end
end
