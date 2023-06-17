class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :talk

  validates :comment, presence: { message: "を入力してください" }
  validates :talk, presence: true
  validates :user, presence: true
end
