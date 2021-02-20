class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, omniauth_providers: [:google_oauth2]

  with_options presence: { message: 'を必ず入力してください' } do
    validates :nickname, :email, :password, :password_confirmation
  end

  validates :nickname, uniqueness: { case_sensitive: true, message: 'は既に登録されています' },
                       format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数字で入力してください' }
  validates :email, uniqueness: { case_sensitive: true, message: 'は既に登録されています' }
  validates :password, format: { with: /[a-z\d]{8,}/i, message: 'は半角英数字８文字以上で入力してください' },
                       confirmation: { message: 'とパスワードが一致していません ' }

  has_many :posts
  has_one :person
  has_many :sns_credentials
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
