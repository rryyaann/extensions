class AddReviewIdToAddons < ActiveRecord::Migration
  def change
    add_column :addons, :review_id, :integer
    add_index :addons, :review_id
  end
end
