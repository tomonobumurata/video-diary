class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 英数字混合6文字以上の正規表現
  VALID_PASSWORD_REGIX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/
  validates :password, format: { with: VALID_PASSWORD_REGIX }, on: :create

  with_options presence: true do
    validates :nickname
    validates :full_name
    validates :birthday
    validates :full_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  end
end
