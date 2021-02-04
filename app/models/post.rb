class Post < ApplicationRecord
  extend  ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :prefecture
  belongs_to :user
  has_one_attached  :image

  with_options presence: { message: "を必ず入力してください" } do 
    validates :menu
    validates :store
    validates :price, numericality: { message: "は半角数字で入力してください" } 
    validates :word
    validates :user
  end

  validates :genre_id, numericality: { other_than: 1, message: "は必ず入力してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "は必ず入力してください" }
  
end
