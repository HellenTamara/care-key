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

# Add sleep goals for this week March 5th
# Sleep goal randomization

puts "Creating sleep goals......."
start_date25 = Date.new(2024, 3, 2)
end_date25 = start_date25 + 6
goal25 = Goal.new(name: "Sleep", start_date: start_date25, end_date: end_date25, frequency: 7 )
goal25.user = go
goal25.save!

# Last week submissions has to be done day by day

# Don't want to include the 7th day
puts "Creating sleep submissions"
(goal25.start_date..(goal25.end_date - 1)).each do |date| # creates a range for start date to end date
  1.times do
    submission = Submission.new(date: date)
    submission.achieved = false
    submission.goal= goal25
    submission.user= go
    submission.save!
  end
end


# -------------------------------------------------------------------------------->

puts "Creating sleep goals......."
start_date1 = Date.new(2024, 2, 24)
end_date1 = start_date1 + 6
goal1 = Goal.new(name: "Sleep", start_date: start_date1, end_date: end_date1, frequency: 7 )
goal1.user = go
goal1.save!

puts "Creating sleep submissions"
(goal1.start_date..goal1.end_date).each do |date| # creates a range for start date to end date
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal1
    submission.user= go
    submission.save!
  end
end

start_date2 = Date.new(2024, 2, 17)
end_date2 = start_date2 + 6
goal2 = Goal.new(name: "Sleep", start_date: start_date2, end_date: end_date2, frequency: 7 )
goal2.user = go
goal2.save!

(goal2.start_date..goal2.end_date).each do |date| # creates a range for start date to end date
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal2
    submission.user= go
    submission.save!
  end
end

start_date3 = Date.new(2024, 2, 10)
end_date3 = start_date3 + 6
goal3 = Goal.new(name: "Sleep", start_date: start_date3, end_date: end_date3, frequency: 7 )
goal3.user = go
goal3.save!

(goal3.start_date..goal3.end_date).each do |date| # creates a range for start date to end date
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal3
    submission.user= go
    submission.save!
  end
end

start_date4 = Date.new(2024, 2, 3)
end_date4 = start_date4 + 6
goal4 = Goal.new(name: "Sleep", start_date: start_date4, end_date: end_date4, frequency: 7 )
goal4.user = go
goal4.save!

(goal4.start_date..goal4.end_date).each do |date| # creates a range for start date to end date
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal4
    submission.user= go
    submission.save!
  end
end


start_date5 = Date.new(2024, 1, 27)
end_date5 = start_date5 + 6
goal5 = Goal.new(name: "Sleep", start_date: start_date5, end_date: end_date5, frequency: 7 )
goal5.user = go
goal5.save!

(goal5.start_date..goal5.end_date).each do |date| # creates a range for start date to end date
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal5
    submission.user= go
    submission.save!
  end
end


start_date6 = Date.new(2024, 1, 20)
end_date6 = start_date6 + 6
goal6 = Goal.new(name: "Sleep", start_date: start_date6, end_date: end_date6, frequency: 7 )
goal6.user = go
goal6.save!

(goal6.start_date..goal6.end_date).each do |date| # creates a range for start date to end date
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal6
    submission.user= go
    submission.save!
  end
end


start_date7 = Date.new(2024, 1, 13)
end_date7 = start_date7 + 6
goal7 = Goal.new(name: "Sleep", start_date: start_date7, end_date: end_date7, frequency: 7 )
goal7.user = go
goal7.save!

(goal7.start_date..goal7.end_date).each do |date| # creates a range for start date to end date
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal7
    submission.user= go
    submission.save!
  end
end

start_date8 = Date.new(2024, 1, 6)
end_date8 = start_date8 + 6
goal8 = Goal.new(name: "Sleep", start_date: start_date8, end_date: end_date8, frequency: 7 )
goal8.user = go
goal8.save!

(goal8.start_date..goal8.end_date).each do |date| # creates a range for start date to end date
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal8
    submission.user= go
    submission.save!
  end
end

# Seeds for foods -------------------------->
puts "Creating food goals............"
start_date26 = Date.new(2024, 3, 2)
end_date26 = start_date26 + 6
goal26 = Goal.new(name: "Food", start_date: start_date26, end_date: end_date26, frequency: 21)
goal26.user = go
goal26.save!

# Submissions for food for last week needs to be done daily                    ------------------------------->
puts "Creating food submissions........."
(goal26.start_date..(goal26.end_date - 1)).each do |date| # creates a range for start date to end date
  3.times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal26
    submission.user= go
    submission.save!
  end
end

# Food submission for today
2.times do
  food_two_subs_date = Date.today
  submission = Submission.new(date: food_two_subs_date)
  submission.achieved = true
  submission.goal= goal26
  submission.user= go
  submission.save!
end

# -------------------------------------------------------------------->

puts "Creating food goals............"
start_date9 = Date.new(2024, 2, 24)
end_date9 = start_date9 + 6
goal9 = Goal.new(name: "Food", start_date: start_date9, end_date: end_date9, frequency: 21)
goal9.user = go
goal9.save!

puts "Creating food submissions........."
(goal9.start_date..goal9.end_date).each do |date| # creates a range for start date to end date
  3.times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal9
    submission.user= go
    submission.save!
  end
end

start_date10 = Date.new(2024, 2, 17)
end_date10 = start_date10 + 6
goal10 = Goal.new(name: "Food", start_date: start_date10, end_date: end_date10, frequency: 21)
goal10.user = go
goal10.save!

(goal10.start_date..goal10.end_date).each do |date| # creates a range for start date to end date
  3.times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal10
    submission.user= go
    submission.save!
  end
end

start_date11 = Date.new(2024, 2, 10)
end_date11 = start_date11 + 6
goal11 = Goal.new(name: "Food", start_date: start_date11, end_date: end_date11, frequency: 21)
goal11.user = go
goal11.save!

(goal11.start_date..goal11.end_date).each do |date| # creates a range for start date to end date
  3.times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal11
    submission.user= go
    submission.save!
  end
end


start_date12 = Date.new(2024, 2, 3)
end_date12 = start_date12 + 6
goal12 = Goal.new(name: "Food", start_date: start_date12, end_date: end_date12, frequency: 21)
goal12.user = go
goal12.save!

(goal12.start_date..goal12.end_date).each do |date| # creates a range for start date to end date
  3.times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal12
    submission.user= go
    submission.save!
  end
end


start_date13 = Date.new(2024, 1, 27)
end_date13 = start_date13 + 6
goal13 = Goal.new(name: "Food", start_date: start_date13, end_date: end_date13, frequency: 21)
goal13.user = go
goal13.save!

(goal13.start_date..goal13.end_date).each do |date| # creates a range for start date to end date
  rand(1..3).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal13
    submission.user= go
    submission.save!
  end
end


start_date14 = Date.new(2024, 1, 20)
end_date14 = start_date14 + 6
goal14 = Goal.new(name: "Food", start_date: start_date14, end_date: end_date14, frequency: 21)
goal14.user = go
goal14.save!

(goal14.start_date..goal14.end_date).each do |date| # creates a range for start date to end date
  rand(1..3).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal14
    submission.user= go
    submission.save!
  end
end


start_date15 = Date.new(2024, 1, 13)
end_date15 = start_date15 + 6
goal15 = Goal.new(name: "Food", start_date: start_date15, end_date: end_date15, frequency: 21)
goal15.user = go
goal15.save!

(goal15.start_date..goal15.end_date).each do |date| # creates a range for start date to end date
  rand(1..3).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal15
    submission.user= go
    submission.save!
  end
end


start_date16 = Date.new(2024, 1, 6)
end_date16 = start_date16 + 6
goal16 = Goal.new(name: "Food", start_date: start_date16, end_date: end_date16, frequency: 21)
goal16.user = go
goal16.save!

(goal16.start_date..goal16.end_date).each do |date| # creates a range for start date to end date
  rand(1..3).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal16
    submission.user= go
    submission.save!
  end
end




# Exercise seeds randomization
puts "Creating exercise goals............"
start_date27 = Date.new(2024, 3, 2)
end_date27 = start_date27 + 6
goal27 = Goal.new(name: "Exercise", start_date: start_date27, end_date: end_date27, frequency: 3, duration: 30)
goal27.user = go
goal27.save!

# Exercise goal submission for last week          neeeds to be made one by one----->
puts "Creating exercise submissions........."
(goal27.start_date..(goal27.end_date)-1).each do |date|
  1.times do
    submission = Submission.new(date: date)
    submission.achieved = false
    submission.goal= goal27
    submission.user= go
    submission.save!
  end
end

puts "Creating exercise goals............"
start_date17 = Date.new(2024, 2, 24)
end_date17 = start_date17 + 6
goal17 = Goal.new(name: "Exercise", start_date: start_date17, end_date: end_date17, frequency: 3, duration: 30)
goal17.user = go
goal17.save!

puts "Creating exercise submissions........."
(goal17.start_date..goal17.end_date).each do |date|
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal17
    submission.user= go
    submission.save!
  end
end
# puts "Exercise submission count: #{goal17.submissions.count}"


puts "Creating exercise goals............"
start_date18 = Date.new(2024, 2, 17)
end_date18 = start_date18 + 6
goal18 = Goal.new(name: "Exercise", start_date: start_date18, end_date: end_date18, frequency: 3, duration: 30)
goal18.user = go
goal18.save!

puts "Creating exercise submissions........."
(goal18.start_date..goal18.end_date).each do |date|
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal18
    submission.user= go
    submission.save!
  end
end
# puts "Exercise submission count: #{goal18.submissions.count}"


puts "Creating exercise goals............"
start_date19 = Date.new(2024, 2, 10)
end_date19 = start_date19 + 6
goal19 = Goal.new(name: "Exercise", start_date: start_date19, end_date: end_date19, frequency: 3, duration: 30)
goal19.user = go
goal19.save!

puts "Creating exercise submissions........."
(goal19.start_date..goal19.end_date).each do |date|
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal19
    submission.user= go
    submission.save!
  end
end

puts "Creating exercise goals............"
start_date20 = Date.new(2024, 2, 3)
end_date20 = start_date20 + 6
goal20 = Goal.new(name: "Exercise", start_date: start_date20, end_date: end_date20, frequency: 3, duration: 30)
goal20.user = go
goal20.save!

puts "Creating exercise submissions........."
(goal20.start_date..goal20.end_date).each do |date|
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal20
    submission.user= go
    submission.save!
  end
end


puts "Creating exercise goals............"
start_date21 = Date.new(2024, 1, 27)
end_date21 = start_date21 + 6
goal21 = Goal.new(name: "Exercise", start_date: start_date21, end_date: end_date21, frequency: 3, duration: 30)
goal21.user = go
goal21.save!

puts "Creating exercise submissions........."
(goal21.start_date..goal21.end_date).each do |date|
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal21
    submission.user= go
    submission.save!
  end
end

puts "Creating exercise goals............"
start_date22 = Date.new(2024, 1, 20)
end_date22 = start_date22 + 6
goal22 = Goal.new(name: "Exercise", start_date: start_date22, end_date: end_date22, frequency: 3, duration: 30)
goal22.user = go
goal22.save!

puts "Creating exercise submissions........."
(goal22.start_date..goal22.end_date).each do |date|
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal22
    submission.user= go
    submission.save!
  end
end

puts "Creating exercise goals............"
start_date23 = Date.new(2024, 1, 13)
end_date23 = start_date23 + 6
goal23 = Goal.new(name: "Exercise", start_date: start_date23, end_date: end_date23, frequency: 3, duration: 30)
goal23.user = go
goal23.save!

puts "Creating exercise submissions........."
(goal23.start_date..goal23.end_date).each do |date|
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal23
    submission.user= go
    submission.save!
  end
end

puts "Creating exercise goals............"
start_date24 = Date.new(2024, 1, 6)
end_date24 = start_date24 + 6
goal24 = Goal.new(name: "Exercise", start_date: start_date24, end_date: end_date24, frequency: 3, duration: 30)
goal24.user = go
goal24.save!

puts "Creating exercise submissions........."
(goal24.start_date..goal24.end_date).each do |date|
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal24
    submission.user= go
    submission.save!
  end
end


# Hard coded goals - for meditation
start_date31 = Date.new(2024, 3, 2)
end_date31 = start_date31 + 6
goal31 = Goal.new(name: "Meditate", start_date: start_date31, end_date: end_date31, frequency: 7, duration:10 )
goal31.user = go
goal31.save!

(goal31.start_date..(goal31.end_date)-1).each do |date| # creates a range for start date to end date
  (rand(0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal31
    submission.user= go
    submission.save!
  end
end


# Hard coded goals - for reading
start_date33 = Date.new(2024, 3, 2)
end_date33 = start_date33 + 6
goal33 = Goal.new(name: "Reading", start_date: start_date31, end_date: end_date31, frequency: 7, duration:5 )
goal33.user = go
goal33.save!

(goal33.start_date..(goal33.end_date)-1).each do |date| # creates a range for start date to end date
  rand((0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal33
    submission.user= go
    submission.save!
  end
end


# Hard coded goals for Stretch
start_date32 = Date.new(2024, 3, 2)
end_date32 = start_date32 + 6
goal32 = Goal.new(name: "Stretch", start_date: start_date32, end_date: end_date32, frequency: 7, duration:5 )
goal32.user = go
goal32.save!

(goal32.start_date..(goal32.end_date)-1).each do |date| # creates a range for start date to end date
  rand((0..1)).times do
    submission = Submission.new(date: date)
    submission.achieved = true
    submission.goal= goal32
    submission.user= go
    submission.save!
  end
end


# start_date32 = Date.new(2024, 3, 4)
# end_date32 = Date.today - 1

# # Have to submit daily
# (goal32.start_date..goal32.end_date).each do |date| # creates a range for start date to end date
#   (rand(0..1)).times do
#     submission = Submission.new(date: date)
#     submission.achieved = true
#     submission.goal= goal32
#     submission.user= go
#     submission.save!
#   end
# end
