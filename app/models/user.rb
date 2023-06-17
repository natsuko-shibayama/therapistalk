class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :talks
  has_many :comments

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :job, presence: true
  validates :description, presence: true

end

