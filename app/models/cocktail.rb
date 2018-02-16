class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :photo_cache, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
