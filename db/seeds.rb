# User.create!(
#     namae: 'admin',
#     email: 'admin@admin.com',
#     password: 'admin@admin.com',
#     password_confirmation: 'admin@admin.com',
#     admin: 'true'
# )

# 9.times do |n|
#   namae = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   password = "password"
#   password_confirmation = "password"
#   admin = false
#   User.create!(namae: namae,
#                email: email,
#                password: password,
#                password_confirmation: password_confirmation,
#                admin: admin,
#                )
# end

10.times do |n|
    name = Faker::Name.name 
    content = Faker::Currency.name
    deadline = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long)
    condition = "完了"
    priority = "低"
    Task.create!(name: name,
                 content: content,
                 deadline: deadline,
                 condition: condition,
                 priority: priority,
                 )
  end

  10.times do |n|
    label = Faker::Color.color_name
    Tag.create!(label: label,
                 )
  end