# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
require 'faker'

10.times do
  Product.create(
    name: Faker::Commerce.product_name
  )
end

# db/seeds.rb
require 'faker'

Product.all.each do |product|
  5.times do
    Review.create(
      rating: Faker::Number.between(from: 1, to: 5),
      comment: Faker::Lorem.paragraph(sentence_count: 2),
      product: product
    )
  end
end
