class AddInfoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :hp_level, :integer
    add_reference :users, :hair, foreign_key: { to_table: :parts }
    add_reference :users, :shirt, foreign_key: { to_table: :parts }
    add_reference :users, :pants, foreign_key: { to_table: :parts }
    add_reference :users, :shoes, foreign_key: { to_table: :parts }
    add_reference :users, :skin_color, foreign_key: { to_table: :parts}
  end
end
