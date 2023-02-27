class ProjectTag < ApplicationRecord
  belongs_to :project
  belongs_to :tag

  # Make sure that there is only one instance for any pair of "[user <-> room]"
  validates_uniqueness_of :project_id, :scope => [:tag_id]
end
