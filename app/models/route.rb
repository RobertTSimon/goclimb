class Route < ApplicationRecord
  belongs_to :site
  has_one :city, through: :site
end
