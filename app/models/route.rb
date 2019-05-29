class Route < ApplicationRecord
  belongs_to :user
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :site
  has_one :city, through: :site
  has_many :photos, as: :imageable
  has_many :reviews

  include AlgoliaSearch

  after_save { routes.each(&:touch) }

  algoliasearch do
    attribute :name, :level, :type, :description, :style
    attribute :site_name
    attribute :city_name
  end

  def site_name
    site.name
  end

  def city_name
    city.name
  end
  # validates :name, presence: true, uniqueness: true
  # validates :latitude, presence: true
  # validates :longitude, presence: true
  # validates :description, presence: true
  # validates :type, presence: true
  # validates :style, presence: true
  # validates :level, presence: true
  # validates :rating, presence: true
end
