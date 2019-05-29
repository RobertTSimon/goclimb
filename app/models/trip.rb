class Trip < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  belongs_to :user
end
