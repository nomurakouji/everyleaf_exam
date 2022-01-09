FactoryBot.define do
  factory :user do
    namae { '田中太郎' }
    email { 'tanaka@taro.com' }
    password_digest { 'tanaka@taro.com' }
  end
end
