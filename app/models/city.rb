class City < ApplicationRecord
  belongs_to :state_province

  validates :name, presence: true
end
