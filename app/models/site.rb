class Site < ApplicationRecord
  belongs_to :city
  has_many :photos, as: :imageable

  validates :name, presence: true
end
