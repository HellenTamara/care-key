require "open-uri"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.destroy_all
Submission.destroy_all
Goal.destroy_all
Avatar.destroy_all
Part.destroy_all
User.destroy_all

# Seeding images:
categories = %w[hair pants shirt shoes skin_color expressions accessories]
categories.each do |category|
  image_files = (Dir.entries("app/assets/images/parts/#{category}/") - [".", "..", ".DS_Store"])
  p image_files
  image_files.each do |img|
    file = URI.open("app/assets/images/parts/#{category}/#{img}")
    name = img.downcase.gsub(/(avatar_|.png)/, "").gsub("_", " ")
    part = Part.new(name: name, category: category)
    part.photo.attach(io: file, filename: "img.png", content_type: "image/png")
    part.price = 0
    part.save
  end
end

shop_categories = %w[hair pants shirt shoes accessories]

shop_categories.each do |category|
  image_files = (Dir.entries("app/assets/images/shop_parts/#{category}/") - [".", "..", ".DS_Store"])
  p image_files
  image_files.each do |img|
    file = URI.open("app/assets/images/shop_parts/#{category}/#{img}")
    name = img.downcase.gsub(/(avatar_|.png)/, "").gsub("_", " ")
    part = Part.new(name: name, category: category)
    part.photo.attach(io: file, filename: "img.png", content_type: "image/png")
    part.price = 100
    part.save
  end
end

puts "Creating main users..."
go = User.new(email: "go.suz55@gmail.com", password: "123456", name: "Go")
go.save!

hellen = User.new(email: "hellen.tamara@outlook.com", password: "123456", name: "Hellen")
hellen.save!

# 2. Create goals
#2.1 + 2.2 date instance & goal instance
puts "Creating sleep goals......."
start_date1 = Date.new(2022, 3, 5)
end_date1 = start_date1 + 6
goal1 = Goal.new(name: "Sleep", start_date: start_date1, end_date: end_date1, frequency: 7 )
goal1.user = go
goal1.save!

start_date2 = Date.new(2022, 3, 12)
end_date2 = start_date2 + 3
goal2 = Goal.new(name: "Sleep", start_date: start_date2 , end_date: end_date2, frequency: 7 )
goal2.user = go
goal2.save!

start_date3 = Date.new(2022, 3, 19)
end_date3 = start_date3 + 5
goal3 = Goal.new(name: "Sleep", start_date: start_date3 , end_date: end_date3, frequency: 7 )
goal3.user = go
goal3.save!


# 3. Create submission using the goals

# create start date and end date so
puts "Creating sleep submissions........."
(goal1.start_date..goal1.end_date).each do |date| # creates a range for state date to end date
  submission = Submission.new(date: date)
  submission.goal = goal1
  submission.user= go
  submission.save!
  # create submission for reach date
end
puts goal1.submissions.count # gives you the number of instances


(goal2.start_date..goal2.end_date).each do |date| # creates a range for state date to end date
  # goal: goal2, user: go
  submission = Submission.new(date: date)  # submission.goal = goal1
  submission.goal = goal2
  submission.user= go
  submission.save!
  # create submission for reach date
end
puts goal2.submissions.count

(goal3.start_date..goal3.end_date).each do |date| # creates a range for state date to end date
  submission = Submission.new(date: date)  # submission.goal = goal1
  submission.goal = goal3
  submission.user= go
  submission.save!

  submission.save!
  # create submission for reach date
end
puts goal3.submissions.count


# Creating exercise goal
puts "Creating exercise goals............"
start_date4 = Date.new(2022, 3, 10)
end_date4 = start_date4 + 2
goal4 = Goal.new(name: "Exercise", start_date: start_date4, end_date: end_date4, frequency: 3, duration: 30)
goal4.user = go
goal4.save!

start_date5 = Date.new(2022, 3, 17)
end_date5 = start_date5 + 1
goal5 = Goal.new(name: "Exercise", start_date: start_date5, end_date: end_date5, frequency: 3, duration: 30)
goal5.user = go
goal5.save!

start_date6 = Date.new(2022, 3, 24)
end_date6 = start_date6 - 1
goal6 = Goal.new(name: "Exercise", start_date: start_date6, end_date: end_date6, frequency: 3, duration: 30)
goal6.user = go
goal6.save!


# Create exercise submissions
puts "Creating exercise submissions........."
(goal4.start_date..goal4.end_date).each do |date| # creates a range for start date to end date
  submission = Submission.new(date: date)
  submission.goal= goal4
  submission.user= go
  submission.save!
end
puts "Should be 3........Exercise submission count: #{goal4.submissions.count}"

(goal5.start_date..goal5.end_date).each do |date| # creates a range for start date to end date
  submission = Submission.new(date: date)
  submission.goal= goal5
  submission.user= go
  submission.save!
end
puts "Should be 2........Exercise submission count: #{goal5.submissions.count}"

(goal6.start_date..goal6.end_date).each do |date| # creates a range for start date to end date
  submission = Submission.new(date: date)
  submission.goal= goal6
  submission.user= go
  submission.save!
end
puts "Should be 0........Exercise submission count: #{goal6.submissions.count}"

# Creating food goal
puts "Creating food goals............"
start_date7 = Date.new(2022, 3, 5)
end_date7 = start_date7 + 6
goal7 = Goal.new(name: "Food", start_date: start_date7, end_date: end_date7, frequency: 21)
goal7.user = go
goal7.save!

puts "Creating food goals............"
start_date8 = Date.new(2022, 3, 12)
end_date8 = start_date8 + 6
goal8 = Goal.new(name: "Food", start_date: start_date8, end_date: end_date8, frequency: 21)
goal8.user = go
goal8.save!

puts "Creating food goals............"
start_date9 = Date.new(2022, 3, 19)
end_date9 = start_date9 + 6
goal9 = Goal.new(name: "Food", start_date: start_date9, end_date: end_date9, frequency: 21)
goal9.user = go
goal9.save!


puts "Creating food submissions........."
(goal7.start_date..goal7.end_date).each do |date| # creates a range for start date to end date
  rand(1..3).times do
    submission = Submission.new(date: date)
    submission.goal= goal7
    submission.user= go
    submission.save!
  end
end
puts "Random number of times eaten in a week ........Food goal submission count: #{goal7.submissions.count}"

(goal8.start_date..goal8.end_date).each do |date| # creates a range for start date to end date
  rand(1..3).times do
    submission = Submission.new(date: date)
    submission.goal= goal8
    submission.user= go
    submission.save!
  end
end
puts "Random number of times eaten in a week ........Food goal submission count: #{goal8.submissions.count}"

(goal9.start_date..goal9.end_date).each do |date| # creates a range for start date to end date
  rand(1..3).times do
    submission = Submission.new(date: date)
    submission.goal= goal9
    submission.user= go
    submission.save!
  end
end
puts "Random number of times eaten in a week ........Food goal submission count: #{goal9.submissions.count}"
