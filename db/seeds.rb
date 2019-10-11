# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create users
10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}@email.com"
  username = first_name[0] + last_name
  password = "password"
  User.create(first_name: first_name, last_name: last_name, email: email, username: username, password: password)
end

# Create tanks
User.all.each do |u|
  5.times do
    name = "Test Tank #{u.tanks.length + 1}"
    size = Faker::Number.within(range: 1..100)
    description = Faker::Quote.famous_last_words
    u.tanks.build(name: name, size: size, description: description)
    u.save
  end
end

# Populate tanks with fish and plants
Tank.all.each do |t|
  t.fish.build(species: "Betta", quantity: 6)
  t.fish.build(species: "Neon Tetra", quantity: 10)
  t.fish.build(species: "Zebra Danio", quantity: 7)
  t.plants.build(species: "Cabomba", quantity: 10)
  t.plants.build(species: "Moss Ball", quantity: 4)
  t.plants.build(species: "Java Moss", quantity: 15)
  t.save
end
