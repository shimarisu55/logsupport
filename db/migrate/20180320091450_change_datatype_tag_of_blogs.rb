class ChangeDatatypeTagOfBlogs < ActiveRecord::Migration[5.1]
  def change
  	change_column :blogs, :tag, :string
  end
end
