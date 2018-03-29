class AddBodyAmountToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :body_amount, :integer
  end
end
