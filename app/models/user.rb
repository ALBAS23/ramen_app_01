class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: { case_sensitive: true, message: "は既に登録されています" }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は半角英数字で入力してください"}
  validates :password, format: { with: /[a-z\d]{8,}/i, message: "は半角英数字８文字以上で入力してください"}

  has_many :posts
  has_one :person

end
