class RemovePartsToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :users, :hair, foreign_key: { to_table: :parts }
    remove_reference :users, :shirt, foreign_key: { to_table: :parts }
    remove_reference :users, :pants, foreign_key: { to_table: :parts }
    remove_reference :users, :shoes, foreign_key: { to_table: :parts }
    remove_reference :users, :skin_color, foreign_key: { to_table: :parts}
  end
end
