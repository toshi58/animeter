class Anime < ApplicationRecord
  has_one_attached :image

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :watches, dependent: :destroy
  has_many :watched_users, through: :watches, source: :user
  has_many :wants, dependent: :destroy
  has_many :wanted_users, through: :wants, source: :user

  has_many :reviews
end
