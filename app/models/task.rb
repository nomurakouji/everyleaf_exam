class Task < ApplicationRecord
  validates :name, presence:true
  validates :content, presence:true
  enum condition: { 未着手: '未着手', 着手中: '着手中', 完了: '完了' }
  scope :task_name_search, -> (query) {where("name LIKE ?", "%#{query}%")}
    def task_name_search(query)
      where("name LIKE ?", "%#{query}%")
    end
  
  scope :condition_search, -> (query) {where(condition: query)}
    def condition_search(query)
      where(condition: query)
    end
end

