class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :purchases
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :first_name, format: { with: VALID_ZENKAKU_REGEX, message: ' must be entered in double-byte characters' },
                         allow_blank: true
  validates :last_name, presence: true
  validates :last_name, format: { with: VALID_ZENKAKU_REGEX, message: ' must be entered in double-byte characters' },
                        allow_blank: true
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: VALID_KATAKANA_REGEX, message: ' must be entered in katakana' },
                              allow_blank: true
  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: VALID_KATAKANA_REGEX, message: ' must be entered in katakana' },
                             allow_blank: true
  validates :birth_date, presence: true
  validates :password,
            format: { with: VALID_PASSWORD_REGEX, message: ' must contain both single-byte alphanumeric characters' }, allow_blank: true
end
