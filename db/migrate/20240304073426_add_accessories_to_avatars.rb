class AddAccessoriesToAvatars < ActiveRecord::Migration[7.1]
  def change
    add_reference :avatars, :accessories, foreign_key: { to_table: :parts }
  end
end
