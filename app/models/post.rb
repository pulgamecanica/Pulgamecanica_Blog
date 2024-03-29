class Post < ApplicationRecord
  belongs_to :author
  has_many :elements
  has_many :post_tags
  has_many :tags, through: :post_tags
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_one_attached :header_image

  validates :title, presence: true
  validates :title, length: { in: 6..30 }

  scope :published_posts, -> do
    where(published: true).order(published_at: :desc)
  end
end
