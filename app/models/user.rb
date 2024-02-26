class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :goals
  has_many :submissions
  has_many :goals_as_owner, through: :submissions, source: :goals
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  test
end
