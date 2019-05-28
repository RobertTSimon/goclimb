class Route < ApplicationRecord
  belongs_to :site
  has_one :city, through: :site

  validates :name, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
