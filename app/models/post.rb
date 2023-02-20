class Post < ApplicationRecord
  belongs_to :author
  has_many :elements
  has_many :post_tags
  has_many :tags, through: :post_tags
  
  has_one_attached :header_image
end
