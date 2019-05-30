class Site < ApplicationRecord
  belongs_to :city
  has_many :photos, as: :imageable
  has_many :routes

  validates :name, presence: true
end
