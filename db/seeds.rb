# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Locker.create(user: User.first, size: "S",  price: 10,  address:"rua de arroios")
Locker.create(user: User.first, size: "M",  price: 20,  address:"rua jair")
Locker.create(user: User.first, size: "L",  price: 25,  address:"rua aloja")
