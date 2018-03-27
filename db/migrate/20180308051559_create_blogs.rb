class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.integer :post_image_id
      t.string :header
      t.text :body
      t.string :book
      t.string :author
      t.string :source
      t.integer :tag
      t.string :claim1
      t.string :claim2
      t.string :basis1
      t.string :basis2
      t.string :example1
      t.string :example2
      
      t.timestamps
    end
  end
end
