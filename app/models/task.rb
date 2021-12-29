class Task < ApplicationRecord
  validates :name, presence:true
  validates :content, presence:true
  enum condition: { "未着手": "未着手", "着手中": "着手中", "完了": "完了" }
end
