FactoryBot.define do
  factory :user do
    namae { '管理者です' }
    email { 'admin@admin.com' }
    password { 'admin@admin.com' }
    password_confirmation { 'admin@admin.com' }
    admin { true }
  end
  factory :second_user , class: User do
    namae { 'user1'}
    email { 'user1@user.com' }
    password { 'user1@user.com' }
    password_confirmation { 'user1@user.com' }
    admin { 'false' }
  end
  factory :third_user , class: User do
    namae { 'user2' }
    email { 'user2@user.com' }
    password { 'user2@user.com' }
    password_confirmation { 'user2@user.com' }
    admin { 'false' }
  end
end
