class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
