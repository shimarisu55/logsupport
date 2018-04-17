class ChangeDeletedAtToUsers < ActiveRecord::Migration[5.1]
  def change
  		change_column :Users, :deleted_at, :datetime, default: nil
  end

end