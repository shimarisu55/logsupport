class ChangeDatatypeDeletedAtOfUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :deleted_at, :boolean, false, default: false

  end
end
