class AddImageIdToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :image_id, :string
  end
end
