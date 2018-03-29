class ChangeDatatypeDeletedAtOfUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :deleted_at, :boolean

  end
end
