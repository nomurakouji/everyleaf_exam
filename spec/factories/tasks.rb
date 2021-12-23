FactoryBot.define do
  factory :task do
    name { 'test_name' }
    content { 'test_content' }
  end
  factory :second_task, class: Task do
    name {'test_name'}
    content { '' }
  end
end
