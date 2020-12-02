# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ga = Group.create(name: "The Winners")
gb = Group.create(name: "The Losers")
gc = Group.create(name: "The Placers")
gd = Group.create(name: "The Slackers")

ua = User.create(username: "John", password: "a")
ub = User.create(username: "Jim", password: "a")
uc = User.create(username: "Sam", password: "a" )
ud = User.create(username: "Sara", password: "a")

ca = Category.create(name: "Sports")
cb = Category.create(name: "Board Games")
cd = Category.create(name: "Shopping")
ce = Category.create(name: "Programming")

ta = Task.create(name: "Basketball")
tb = Task.create(name: "Chess")
tc = Task.create(name: "Turkey")
td = Task.create(name: "C++")

User.all.each do |user|
  Group.all.each do |group|
    user.groups << group
  end
end

Group.all.each do |group|
  Task.all.each do |task|
    group.tasks << task
  end
end

Category.all.each do |category|
  Task.all.each do |task|
    category.tasks << task
  end
end
