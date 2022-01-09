FactoryBot.define do
  factory :user do
    id { '1' }
    namae { '管理者です' }
    email { 'admin@admin.com' }
    password { 'admin@admin.com' }
    password_digest { 'admin@admin.com' }
    admin {'true'}
  end
  factory :second_user , class: User do
    id { '2' }
    namae { 'user1'}
    email { 'user1@user.com' }
    password { 'user1@user.com' }
    password_digest { 'user1@user.com' }
    admin { 'false' }
  end
  factory :third_user , class: User do
    id { '3' }
    namae { 'user2' }
    email { 'user2@user.com' }
    password { 'user2@user.com' }
    password_digest { 'user2@user.com' }
    admin { 'false' }
  end
end
