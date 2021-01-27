class Post < ApplicationRecord
  extend  ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :prefecture

  with_options presence: true do 
    validates :menu
    validates :store
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :genre
    validates :word
    validates :prefecture
    validates :user 
  end

  validates :genre, numericality: { other_than: 1 }
  validates :prefecture, numericality: { other_than: 1 }
  
end
