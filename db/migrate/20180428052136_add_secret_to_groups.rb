class AddSecretToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :secret, :boolean, default: false, null: false
  end
end
