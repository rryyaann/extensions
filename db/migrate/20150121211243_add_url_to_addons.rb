class AddUrlToAddons < ActiveRecord::Migration
  def change
    add_column :addons, :url, :string
  end
end
