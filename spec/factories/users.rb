FactoryBot.define do
  factory :user do
    namae { '管理者です' }
    email { 'admin@admin.com' }
    password_digest { 'admin@admin.com' }
    admin {'true'}
  end
  factory :second_user do
    namae { 'user1'}
    email { 'user1@user.com' }
    password_digest { 'user1@user.com' }
    admin { 'false' }
  end
  factory :third_user do
    namae { 'user2' }
    email { 'user2@user.com' }
    password_digest { 'user2@user.com' }
    admin { 'false' }
  end
end
