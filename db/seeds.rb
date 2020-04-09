# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# categories
Category.create(name: 'Education', priority: 1)
Category.create(name: 'Technology', priority: 2)
Category.create(name: 'Sports', priority: 3)
Category.create(name: 'Business', priority: 4)
Category.create(name: 'Fashion', priority: 5)
Category.create(name: 'Romance', priority: 6)
Category.create(name: 'Health', priority: 7)
Category.create(name: 'Entertainment', priority: 8)