# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating main users..."
go = User.new(email: "go.suz55@gmail.com", password: "123456", name: "Go Suzuki")
go.save

nina = User.new(email: "karenina2798@gmail.com", password: "123456", name: "Nina Wongsordjo")
nina.save

sarah = User.new(email: "sealove14@aim.com", password: "123456", name: "Sarah Amour")
sarah.save

hellen = User.new(email: "hellen.tamara@outlook.com", password: "123456", name: "Hellen Naito")
hellen.save
