class User < ApplicationRecord
  after_create :create_avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :goals, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_one :avatar, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :password, presence: true

  def create_avatar
    avatar = Avatar.create(user: self)
    avatar.hp_level = 100
    avatar.coins = 1000
    avatar.hair = Part.where(category: "hair").first
    avatar.accessories = Part.where(category: "accessories").first
    avatar.shoes = Part.where(category: "shoes").first
    avatar.pants = Part.where(category: "pants").first
    avatar.shirt = Part.where(category: "shirt").first
    avatar.skin_color = Part.where(category: "skin_color").first
    # avatar.purchased_parts = ["hair short red", "hair long lightbrown", "hair long blonde", "hair short blonde", "hair short black", "hair short brown", "hair long red", "hair long black", "pants white", "pants bluejeans", "pants black", "skin color tan", "skin color black", "skin color light", "skin color brown"]
    avatar.expression = Part.where(name: "expression default").first
    avatar.save
  end

  def current_sleep_goal
    sleep_goal_for(Date.today) || Goal.create(name: "Sleep", start_date: Date.today, end_date: Date.today + 6, frequency: 7, user: self, duration: 8)
  end

  def sleep_goal_for(date)
    goals.where(name: "Sleep").find_by("start_date <= :date AND end_date >= :date", date: date)
  end

  def today_sleep_submission
    goal = sleep_goal_for(Date.today)
    goal.submissions.find_by(["date = ?", Date.today])
  end

  def current_exercise_goal
    exercise_goal_for(Date.today) || Goal.create(name: "Exercise", start_date: Date.today, end_date: Date.today + 6, frequency: 3, user: self)
  end

  def current_eating_goal
    food_goal_for(Date.today) || Goal.create(name: "Food", start_date: Date.today, end_date: Date.today + 6, frequency: 21, user: self)
  end

  def food_goal_for(date)
    goals.where(name: "Food").find_by("start_date <= :date AND end_date >= :date", date: date)
  end

  def exercise_goal_for(date)
    goals.where(name: "Exercise").find_by("start_date <= :date AND end_date >= :date", date: date)
  end

  def goals_of_the_week
    goals.where("start_date <= :date AND end_date >= :date", date: Date.today).order(:created_at)
  end

  def sleep_percentage_for(date)
    goal = sleep_goal_for(date)
    return 0 unless goal
    (goal.submissions.where(["achieved = ? and date = ?", true, date]).count * 100) / (goal.frequency / 7) #this is based on daily goals
  end

  def food_percentage_for(date)
    goal = food_goal_for(date)
    return 0 unless goal
    (goal.submissions.where(["achieved = ? and date = ?", true, date]).count * 100) / (goal.frequency / 7) #this is based on daily goals
  end

  def weekly_exercise_percentage_for(date)
    goal = exercise_goal_for(date)
    return 0 unless goal
    goal.submissions.where(achieved: true).count / goal.frequency.to_f * 100
  end

  def daily_exercise_percentage_for(date)
    goal = exercise_goal_for(date)
    return 0 unless goal
    goal.submissions.where(["achieved = ? and date = ?", true, date]).count * 100
  end
end
