class StateProvince < ApplicationRecord
  validates :name, presence: true
  has_many :cities
  
end
