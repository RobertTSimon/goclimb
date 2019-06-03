class Route < ApplicationRecord
  belongs_to :user
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :site, optional: true
  has_one :city, through: :site
  has_many :photos, as: :imageable
  has_many :reviews
  has_many :trips, through: :route_trip

  accepts_nested_attributes_for :photos

  validates :name, presence: true, uniqueness: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validate :photos?

  include AlgoliaSearch

  algoliasearch do
    attribute :name, :level, :type, :description, :style
    attribute :site_name
    attribute :city_name
  end

  def site_name
    site_id.nil? ? nil : site.name
  end

  def city_name
    site_id.nil? ? nil : city.name
  end

  def photos?
    errors.add(:has_photos, "need photo") if photos.length.zero?
  end
end
