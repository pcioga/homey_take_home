# Clear existing data
Project.destroy_all
User.destroy_all

# Create Users
user1 = User.create!(
  name: "Alice",
  email: "alice@homey.com",
  password: "password",
  password_confirmation: "password"
)

user2 = User.create!(
  name: "John",
  email: "john@homey.com",
  password: "password",
  password_confirmation: "password"
)

# Create Projects
project1 = Project.create!(
  name: "Wayne Manor",
  project_manager: user1
)
project1.users << [user1, user2]

project2 = Project.create!(
  name: "The Burrow",
  project_manager: user1
)
project2.users << [user1, user2]

project3 = Project.create!(
  name: "Bag End",
  project_manager: user2
)
project3.users << [user1, user2]

# Add more users
for i in 1..5
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
  i.odd? ? project1.users << user : project2.users << user 
end
