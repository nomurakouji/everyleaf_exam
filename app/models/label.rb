class Label < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :tasks, through: :favorites
end
