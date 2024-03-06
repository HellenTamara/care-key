class AddPurchasedPartsToAvatar < ActiveRecord::Migration[7.1]
  def change
    add_column :avatars, :purchased_parts, :string, array: true, default: []
  end
end
