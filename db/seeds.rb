# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PostVote.destroy_all
User.destroy_all

users = User.create([
  {name: "James", email: 'jcostello10@gmail.com', password: "abc123", password_confirmation: "abc123" },
  {name: "Ace", email: "mrace@gmail.com", password: "abc123", password_confirmation: "abc123" },
  {name: "Fleetwood Mac", email: "fleetwood@gmail.com", password: "123", password_confirmation: "123"}
  ])

puts "Database seeded with #{users.length} users!"


Post.destroy_all

posts = Post.create([
  {title: "Title1", content: "Seeds", vote: 10, user_id: 3 },
  {title: "Title2", content: "Seeds", vote: 0, user_id: 3 },
  {title: "Titleseed", content: "ContentSeed", vote: 100, user_id: 3},
  ])

puts "Database seeded with #{posts.length} posts!"

Comment.destroy_all

comments = Comment.create([
   {content: "commenttest1", vote: 10 },
   {content: "commenttest2", vote: 50 },
   {content: "commenttest3", vote: 100 }
  ])

puts "Database seeded with #{comments.length} comments!"
