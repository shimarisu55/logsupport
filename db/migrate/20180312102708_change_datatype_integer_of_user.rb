class ChangeDatatypeIntegerOfUser < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :tag, :string
  end
end
