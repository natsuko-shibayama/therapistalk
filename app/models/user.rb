class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :talks
  has_many :comments

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }
  validates :job, presence: true
  validates :description, presence: true
  validates :role, presence: true, numericality: { other_than: 0 , message: "can't be blank"}


end

