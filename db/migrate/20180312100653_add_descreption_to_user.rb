class AddDescreptionToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :descreption, :text
  end
end
