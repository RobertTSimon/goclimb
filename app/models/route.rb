class Route < ApplicationRecord
  belongs_to :site

  validates :name, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true
  validates :type, presence: true
  validates :style, presence: true
  validates :level, presence: true
  validates :rating, presence: true
end
