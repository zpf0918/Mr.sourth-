class AddAvatarToPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :avatar, :string
  end
end
