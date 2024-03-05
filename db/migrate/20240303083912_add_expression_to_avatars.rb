class AddExpressionToAvatars < ActiveRecord::Migration[7.1]
  def change
    add_reference :avatars, :expression, foreign_key: { to_table: :parts}
  end
end
