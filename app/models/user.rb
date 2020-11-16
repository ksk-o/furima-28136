class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchases
  
  with_options presence: true do  
    NAME_REGEX =           /\A[ぁ-んァ-ン一-龥]/
    NAME_FURIGANA_REGEX =  /\A[ァ-ヶー－]+\z/
    validates :nickname
    validates :email,               format: {with: /\A[^@\s]+@[^@\s]+\z/ }, uniqueness: {case_sensitive: true}
    validates :password,            format: {with: /\A(?=\d{0,99}+[a-z])(?=[a-z]{0,99}+\d)[a-z\d]{6,100}+\z/i }, length: { minimum: 6 }
    validates :last_name,           format: {with: NAME_REGEX }
    validates :first_name,          format: {with: NAME_REGEX }
    validates :last_name_furigana,  format: {with: NAME_FURIGANA_REGEX }
    validates :first_name_furigana, format: {with: NAME_FURIGANA_REGEX }
    validates :birthday
  end
end