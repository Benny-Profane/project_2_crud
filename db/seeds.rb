# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

users = User.create([
  {name: "James", email: 'jcostello10@gmail.com', password: "abc123", password_confirmation: "abc123" },
  {name: "Ace", email: "mrace@gmail.com", password: "abc123", password_confirmation: "abc123" }
  ])

puts "Database seeded with #{users.length} users!"


Post.destroy_all

posts = Post.create([
  {content: "Quotes?", vote: 10 },
  {content: "Facts?", vote: 0 }
  ])

puts "Database seeded with #{posts.length} posts!"
