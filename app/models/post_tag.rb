class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag
  
  # Make sure that there is only one instance for any pair of "[user <-> room]"
  validates_uniqueness_of :post_id, :scope => [:tag_id]
end
