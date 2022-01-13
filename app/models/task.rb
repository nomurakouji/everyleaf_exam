class Task < ApplicationRecord
  validates :name, presence:true
  validates :content, presence:true
  validates :deadline, presence:true
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags,through: :post_tags
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



  def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
      current_tags = self.tags.pluck(:name) unless self.tags.nil?
      # 現在取得したタグから送られてきたタグを除いてoldtagとする
      old_tags = current_tags - sent_tags
      # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
      new_tags = sent_tags - current_tags
  
      # 古いタグを消す
      old_tags.each do |old|
        self.tags.delete Tag.find_by(name: old)
      end
  
      # 新しいタグを保存
      new_tags.each do |new|
        new_post_tag = Tag.find_or_create_by(name: new)
        self.tags << new_post_tag
     end
  end
end

