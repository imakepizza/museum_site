class Element < ApplicationRecord
  belongs_to :article

  validates :element_type, inclusion: { in: ['paragraph', 'image', 'video-embed']}
  has_rich_text :content
end
