# Destruction des users et des events à chaque lancement du seed
User.destroy_all
Event.destroy_all
Attendance.destroy_all

# Création de la base de données users
5.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph_by_chars,
    email: Faker::Internet.email(domain: 'yopmail.com'),
    password:Faker::Internet.password(min_length: 8)
  )
end
puts '5 users créés'

# Création de la base de données events
20.times do
  Event.create(
    start_date: Faker::Date.forward(days: 10),
    duration: 60,
    title: Faker::Movie.title,
    description: Faker::Lorem.paragraph_by_chars,
    price: 10,
    location: Faker::Address.city,
    admin_id: User.all.sample.id
  )
end
puts '20 Events créés'

# Création de la base attendance
5.times do
  Attendance.create(
    stripe_customer_id: Faker::Number.number(digits: 10),
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id
  )
end
puts '5 réservations créées'
