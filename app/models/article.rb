class Article < ApplicationRecord
  belongs_to :admin_user
  has_many :elements

  has_one_attached :header_image
end
