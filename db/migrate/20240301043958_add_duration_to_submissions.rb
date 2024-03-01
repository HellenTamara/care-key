class AddDurationToSubmissions < ActiveRecord::Migration[7.1]
  def change
    add_column :submissions, :duration, :integer
  end
end
