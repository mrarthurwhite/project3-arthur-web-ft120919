# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Registration.destroy_all

u1 = User.create({name: "Arthur", email: "mister.arthur.white@gmail.com", password: "1"})
u2 = User.create({name: "Alpha", email: "alpha@gmail.com", password: "1"})
u3 = User.create({name: "Omega", email: "omega@gmail.com", password: "1"})

e1 = Event.create({title: "Edify",
                   location: 'Top of the world',
                   description: "Feel tops",
                   meeting_datetime: DateTime.new(2020,
                                                  03,
                                                  24,
                                                  19,
                                                  00, 0),
                   host: u1})

Registration.create([
                       { registrant: u2, event: e1, rsvp: "Yes", comment: "Vegan servings only please."},
                       { registrant: u3, event: e1, rsvp: "Maybe", comment: "Will know by Monday."}
                   ])
