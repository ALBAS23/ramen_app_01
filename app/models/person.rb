class Person < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: { message: 'を必ず入力してください' } do
    validates :f_store_one
    validates :f_topping
  end

  validates :genre_id, numericality: { other_than: 1, message: 'を必ず入力してください' }
  validates :self_introduction, length: { maximum: 400, message: 'は400文字以下で入力してください' }

  belongs_to :user
  belongs_to :genre
  belongs_to :prefecture
end
