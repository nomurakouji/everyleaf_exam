class Tag < ApplicationRecord
  has_many :post_tags,dependent: :destroy
  has_many :tasks, through: :post_tags
  validates :name, uniqueness: true, presence:true
end
