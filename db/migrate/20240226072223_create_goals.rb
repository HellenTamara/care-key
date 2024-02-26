class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :frequency
      t.integer :duration
      t.references :user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
