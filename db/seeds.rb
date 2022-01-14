User.create!(
    namae: 'admin',
    email: 'admin@admin.com',
    password: 'admin@admin.com',
    password_confirmation: 'admin@admin.com',
    admin: 'true'
)

9.times do |n|
  namae = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  password_confirmation = "password"
  admin = false
  User.create!(namae: namae,
               email: email,
               password: password,
               password_confirmation: password_confirmation,
               admin: admin,
               )
end

10.times do |n|
    name = Faker::Name.name 
    content = Faker::Currency.name
    deadline = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long)
    condition = "完了"
    priority = "低"
    user_id = User.first.id
    Task.create!(name: name,
                 content: content,
                 deadline: deadline,
                 condition: condition,
                 priority: priority,
                 user_id: user_id,
                 )
end

Tag.create!(
  [
    {label: 'red'},
    {label: 'bule'},
    {label: 'black'},
    {label: 'yellow'},
    {label: 'white'},
    {label: 'purple'},
    {label: 'green'},
    {label: 'grey'},
    {label: 'pink'},
    {label: 'brown'},
  ]
)