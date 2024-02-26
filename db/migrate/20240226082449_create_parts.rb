class CreateParts < ActiveRecord::Migration[7.1]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
