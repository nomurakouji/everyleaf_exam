class Task < ApplicationRecord
  validates :name, presence:true
  validates :content, presence:true
  enum condition: { 未着手: '未着手', 着手中: '着手中', 完了: '完了' }
  scope :task_name_search, -> (name) {where("name LIKE ?", "%#{name}%")}
    # def task_name_search(query)
    #   where("name LIKE ?", "%#{query}%")
    # end
  
  scope :condition_search, -> (condition) {where(condition: condition)}
    # def condition_search(query)
    #   where(condition: query)
    # end
  enum priority: {高: 1, 中: 2, 低: 3}
  belongs_to :user
end

