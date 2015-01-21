class AddUserIdToAddons < ActiveRecord::Migration
  def change
    add_column :addons, :user_id, :integer
    add_index :addons, :user_id
  end
end
