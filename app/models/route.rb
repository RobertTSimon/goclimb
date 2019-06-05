class Route < ApplicationRecord
  belongs_to :user
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :site, optional: true
  has_one :city, through: :site
  has_many :photos, as: :imageable
  has_many :reviews
  has_many :route_trips, dependent: :destroy
  has_many :trips, through: :route_trip

  accepts_nested_attributes_for :photos

  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  include AlgoliaSearch

  algoliasearch do
    attribute :name, :style, :level, :type, :description
    attribute :site_name
    attribute :city_name

    searchableAttributes ['name', 'style', 'level', 'type', 'site_name', 'city_name', 'description']
  end

  def site_name
    site_id.nil? ? nil : site.name
  end

  def city_name
    site_id.nil? ? nil : city.name
  end

  ALERTS = [ "Nothing to report", "Weeds on the wall (needs cleaning)", "Missing bolts", "Dangerous approach", "falling rocks", "Other (see reviews)"]
end
