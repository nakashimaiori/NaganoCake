# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './db/seeds/admin.rb'
require './db/seeds/customer.rb'
require './db/seeds/genre.rb'
require './db/seeds/product.rb'
require './db/seeds/order.rb'
require './db/seeds/cart_item.rb'
require './db/seeds/delivery.rb'
require './db/seeds/order_item.rb'

