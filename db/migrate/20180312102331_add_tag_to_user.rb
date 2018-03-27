class AddTagToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tag, :integer
  end
end
