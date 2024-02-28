class CreateAvatars < ActiveRecord::Migration[7.1]
  def change
    create_table :avatars do |t|
      t.string :name
      t.integer :hp_level
      t.references :user, null: false, foreign_key: true
      t.references :skin_color, foreign_key: { to_table: :parts}
      t.references :shirt, foreign_key: { to_table: :parts}
      t.references :shoe, foreign_key: { to_table: :parts}
      t.references :pants, foreign_key: { to_table: :parts}
      t.references :hair, foreign_key: { to_table: :parts}

      t.timestamps
    end
  end
end
