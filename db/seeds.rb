
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(url).read
ingredients = JSON.parse(serialized_ingredients)

puts 'Cleaning Ingredients...'
Ingredient.destroy_all

puts 'Creating ingredients...'
ingredients['drinks'].each do |ingredient|
  puts "Creating #{ingredient['strIngredient1']}"
  Ingredient.create!(name: ingredient['strIngredient1'])
end
puts 'Ingredients done!'

puts 'Cleaning Cocktails...'
Cocktail.destroy_all

puts 'Creating cocktails...'
15.times do
  cocktail_name = Faker::TvShows::BreakingBad.unique.episode
  cocktail_description = Faker::TvShows::SouthPark.unique.quote
  puts "Creating #{cocktail_name}"
  Cocktail.create!(name: cocktail_name, description: cocktail_description)
end

puts "Cocktails done!"
