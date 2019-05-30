class Trip < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  belongs_to :user
  has_many :route_trips
  has_many :routes, through: :route_trips
end
