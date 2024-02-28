class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :goals
  has_many :submissions
  belongs_to :hair, class_name: "Part", optional: true
  belongs_to :shirt, class_name: "Part", optional: true
  belongs_to :shoes, class_name: "Part", optional: true
  belongs_to :pants, class_name: "Part", optional: true
  belongs_to :skin_color, class_name: "Part", optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :password, presence: true

  def current_sleep_goal
    goals.where(name: "Sleep").find_by("start_date <=? AND end_date >= ?", Date.today, Date.today)
  end

  def current_exercise_goal
    goals.where(name: "Exercise").find_by("start_date <=? AND end_date >= ?", Date.today, Date.today)
  end

  def current_eating_goal
    goals.where(name: "Eating").find_by("start_date <=? AND end_date >= ?", Date.today, Date.today)
  end
end
