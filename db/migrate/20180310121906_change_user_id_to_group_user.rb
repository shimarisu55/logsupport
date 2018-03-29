class ChangeUserIdToGroupUser < ActiveRecord::Migration[5.1]
  def change
  	def up
  		change_column :group_id, :references, null: false, default: 0
  		change_column :user_id, :references, null: false, default: 0
  	end

  	def down
  		change_column :group_users, :user_id, :integer, null: true
	end
  end
end
