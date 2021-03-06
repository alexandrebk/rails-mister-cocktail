# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Destroy table"

Ingredient.destroy_all
Dose.destroy_all
Cocktail.destroy_all

puts "======"
puts "Create table"

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

response    = open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
ingredients = JSON.parse(response)

ingredients["drinks"].each do |element|
  # p element['strIngredient1']
  Ingredient.create(name: element['strIngredient1'])
end

puts "Seeds done"
