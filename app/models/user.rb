class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :likes, dependent: :destroy
  has_many :liked_animes, through: :likes, source: :anime
  has_many :watches, dependent: :destroy
  has_many :watched_animes, through: :watches, source: :anime
  has_many :wants, dependent: :destroy
  has_many :wanted_animes, through: :wants, source: :anime

  has_many :reviews
  has_many :comments

  def already_liked?(anime)
    likes.exists?(anime_id: anime.id)
  end

  def already_watched?(anime)
    watches.exists?(anime_id: anime.id)
  end

  def already_wanted?(anime)
    wants.exists?(anime_id: anime.id)
  end
end
