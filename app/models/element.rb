class Element < ApplicationRecord
  belongs_to :post
  validates :element_type, inclusion: {in: ['paragraph', 'image', 'video-embed', 'title', 'pdf', "code_file"]}

  has_one_attached :image
  has_one_attached :file_pdf
  has_one_attached :code_file
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

  def code_file?
    element_type == 'code_file'
  end

  def pdf?
    element_type == 'pdf'
  end

end
