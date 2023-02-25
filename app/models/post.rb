class Post < ApplicationRecord
  belongs_to :author
  has_many :elements
  has_many :post_tags
  has_many :tags, through: :post_tags
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :header_image
end
