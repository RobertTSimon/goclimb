class Imageable < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  
end
