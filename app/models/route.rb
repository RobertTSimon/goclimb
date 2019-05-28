class Route < ApplicationRecord
  belongs_to :user
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :site
  has_one :city, through: :site

  # validates :name, presence: true, uniqueness: true
  # validates :latitude, presence: true
  # validates :longitude, presence: true
  # validates :description, presence: true
  # validates :type, presence: true
  # validates :style, presence: true
  # validates :level, presence: true
  # validates :rating, presence: true
end
