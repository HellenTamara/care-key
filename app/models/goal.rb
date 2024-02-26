class Goal < ApplicationRecord
    # Associations
    has_many :submissions
    # A goal can have many submissions
    belongs_to :user
    # A goal can only have one user
    validates :name, :start_date, :end_date, :frequency, presence: true
end
