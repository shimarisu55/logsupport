class RenameImageIdColumnToBlogId < ActiveRecord::Migration[5.1]
  def change
    rename_column :post_comments, :image_id, :blog_id
  end
end
