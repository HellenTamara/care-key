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
Part.destroy_all
Avatar.destroy_all
User.destroy_all

puts "Creating main users..."
go = User.new(email: "go.suz55@gmail.com", password: "123456", name: "Go Suzuki")
go.save!

# 2. Create goals
#2.1 + 2.2 date instance & goal instance
puts "Creating goals......."
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
puts "Creating submissions........."
(goal1.start_date..goal1.end_date).each do |date| # creates a range for state date to end date
  submission = Submission.new(date: date)
  submission.goal = goal1
  submission.user= go
  submission.save!
  # submission.goal = goal1
  # goal: goal1 does the same thing
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

# Seeding images:

categories = %w[hair pants shirt shoes skin_color]

categories.each do |category|
  image_files = (Dir.entries("app/assets/images/parts/#{category}/") - [".", "..", ".DS_Store"])
  p image_files
  image_files.each do |img|
    file = URI.open("app/assets/images/parts/#{category}/#{img}")
    name = img.downcase.gsub(/(avatar_|.png)/, "").gsub("_", " ")
    part = Part.new(name: name, category: category)
    part.photo.attach(io: file, filename: "img.png", content_type: "image/png")
    part.save
  end
end
