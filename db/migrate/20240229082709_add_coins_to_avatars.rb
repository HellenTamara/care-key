class AddCoinsToAvatars < ActiveRecord::Migration[7.1]
  def change
    add_column :avatars, :coins, :integer
  end
end
