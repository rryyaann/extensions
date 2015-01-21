class CreateAddons < ActiveRecord::Migration
  def change
    create_table :addons do |t|
      t.string :description

      t.timestamps
    end
  end
end
