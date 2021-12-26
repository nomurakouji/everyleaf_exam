FactoryBot.define do
  factory :task do
    name { 'taro' }
    content { 'コンテント１' }
    deadline{'2021年11月１日'}
  end
  # factory :second_task, class: Task do
  #   name { 'タスク２' }
  #   content { 'コンテント２' }
  # end
end
