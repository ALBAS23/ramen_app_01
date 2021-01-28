class Post < ApplicationRecord
  extend  ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :prefecture
  belongs_to :user

  with_options presence: true do 
    validates :menu
    validates :store
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :word
    validates :user
  end

  validates :genre_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  
end
