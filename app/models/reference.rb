class Reference < ApplicationRecord
  belongs_to :project

  validates :name, :link, presence: true
  validates :name, length: { in: 2..50 }
  validates :link, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
