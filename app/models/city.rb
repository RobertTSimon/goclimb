class City < ApplicationRecord
  belongs_to :state_province
  has_many :sites
 

  validates :name, presence: true
end
