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
  validates :name, :email, :password, presence: true
end
