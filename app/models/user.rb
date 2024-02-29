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
    avatar.hair = Part.where(category: "hair").first
    avatar.shoes= Part.where(category: "shoes").first
    avatar.pants = Part.where(category: "pants").first
    avatar.shirt = Part.where(category: "shirt").first
    avatar.skin_color = Part.where(category: "skin_color").first
    avatar.save
  end

  def current_sleep_goal
    goals.where(name: "Sleep").find_by("start_date <=? AND end_date >= ?", Date.today, Date.today)
  end

  def current_exercise_goal
    goals.where(name: "Exercise").find_by("start_date <=? AND end_date >= ?", Date.today, Date.today)
  end

  def current_eating_goal
    goals.where(name: "Food").find_by("start_date <=? AND end_date >= ?", Date.today, Date.today)
  end
end
