class Element < ApplicationRecord
  belongs_to :post
  validates :element_type, inclusion: {in: ['paragraph', 'image', 'video-embed', 'title']}

  has_one_attached :image
  has_rich_text :content
  has_one :title, dependent: :destroy

  def paragraph?
    element_type == 'paragraph'
  end

  def image?
    element_type == 'image'
  end

  def title?
    element_type == 'title'
  end

end
