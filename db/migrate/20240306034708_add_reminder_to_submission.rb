class AddReminderToSubmission < ActiveRecord::Migration[7.1]
  def change
    add_column :submissions, :reminder, :boolean, default: false
  end
end
