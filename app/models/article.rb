class Article < ApplicationRecord
  paginates_per 5
  belongs_to :admin

  validates :title, :short_description, :description, presence: true
  validates :title, length: 1..100
end
