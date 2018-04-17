class ChangeDeletedAtToUsers < ActiveRecord::Migration[5.1]
  def change
  		change_column :Users, :deleted_at, :datetime
  end

end