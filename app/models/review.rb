class Review < ApplicationRecord
  belongs_to :reviewable
  belongs_to :user
end
