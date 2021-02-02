class Person < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
    validates :f_store_one
    validates :f_topping
  end

  validates :genre_id, numericality: { other_than: 1 }

  belongs_to :user
  belongs_to :genre
  belongs_to :prefecture
end
