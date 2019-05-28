class Reviewable < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  validates :title, presence: true
  validates :description, presence: true
  validates :rating, presence: true
end
