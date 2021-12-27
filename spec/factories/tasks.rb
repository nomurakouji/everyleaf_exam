FactoryBot.define do
  factory :task do
    name { 'タスク1' }
    content { 'コンテント1' }
    deadline {'2000/1/1'}
  end
  factory :second_task, class: Task do
    name { 'タスク2' }
    content { 'コンテント2' }
    deadline {'2021/12/27'}
  end
  factory :third_task, class: Task do
    name {'タスク3'}
    content {'コンテント3'}
    deadline {'1111/11/11'}
  end
end
