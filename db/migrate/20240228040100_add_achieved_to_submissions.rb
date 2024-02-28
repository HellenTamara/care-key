class AddAchievedToSubmissions < ActiveRecord::Migration[7.1]
  def change
    add_column :submissions, :achieved, :boolean
  end
end
