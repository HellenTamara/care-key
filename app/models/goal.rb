class Goal < ApplicationRecord
  # Associations
  has_many :submissions
  # A goal can have many submissions
  belongs_to :user
  # A goal can only have one user
  validates :name, presence: true
  validates :start_date, presence: true
  # validates :frequency, presence: true
end
