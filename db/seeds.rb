# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "robert@email.com", password: "123456", route_setter: true)
User.create(email: "simon@email.com", password: "123456")
Route.create(name: "Falling Rock")
Route.create(name: "Flying Jamaican")
Route.create(name: "Swimming Jamaican")
City.create(name: "Montreal")
Site.create(name: "Mont-Trenchant")
StateProvince.create(name: "Quebec")


