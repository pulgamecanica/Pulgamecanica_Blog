class Project < ApplicationRecord
	belongs_to :author
  has_many :references
  has_many :project_tags
  has_many :tags, through: :project_tags
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_one_attached :background_image
  has_many_attached :project_images

  validates :title, :rank, :description, presence: true
  validates :title, length: { in: 2..20 }
  validates :description, length: { in: 15..650 }
  validates :rank, numericality: { in: 0..5 }

end
