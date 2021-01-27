class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/}
  validates :password, format: { with: /[a-z\d]{8,}/i}

end
