class Page < ApplicationRecord
  belongs_to :author
  validates :title, length: { in: 1..12 }
  
end
