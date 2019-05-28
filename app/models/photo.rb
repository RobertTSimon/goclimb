class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  
end
