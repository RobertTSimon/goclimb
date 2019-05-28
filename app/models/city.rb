class City < ApplicationRecord
  belongs_to :state_provinces
  validates :name, presence: true
end
