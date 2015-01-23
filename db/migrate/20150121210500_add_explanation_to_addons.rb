class AddExplanationToAddons < ActiveRecord::Migration
  def change
    add_column :addons, :explanation, :string
  end
end
