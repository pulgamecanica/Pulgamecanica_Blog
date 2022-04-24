class Title < ApplicationRecord
  belongs_to :element
  validates :title_type, inclusion: {in: [0, 1, 2,]}

  def title0?
    title_type == 0
  end

  def title1?
    title_type == 1
  end

  def title2?
    title_type == 2
  end

end
