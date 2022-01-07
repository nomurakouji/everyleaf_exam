class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_secure_password
  validates :namae, presence:true
  validates :email, presence:true
end
