class RenameShoesToAvatars < ActiveRecord::Migration[7.1]
  def change
    rename_column :avatars, :shoe_id, :shoes_id
  end
end
