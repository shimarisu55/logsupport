class AddManegerToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :manage_id, :integer
  end
end
