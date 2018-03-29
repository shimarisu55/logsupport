class AddDescreptionToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :descreption, :text
  end
end
