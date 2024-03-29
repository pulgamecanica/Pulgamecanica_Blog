class Page < ApplicationRecord
  belongs_to :author
  validates :title, length: { in: 1..12 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  
end
