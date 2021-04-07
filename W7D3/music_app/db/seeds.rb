# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

angela = User.create!(email: 'angelaturi99@gmail.com', password: 'password')
megan = User.create!(email: 'mmcnulty@appacademy.io', password: 'password')

maggie_rogers = Band.create!(name: 'Maggie Rogers')
beatles = Band.create!(name: 'The Beatles')


