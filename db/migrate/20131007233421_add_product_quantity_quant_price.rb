class AddProductQuantityQuantPrice < ActiveRecord::Migration
  def change
  	add_column :calendar_items, :product_id, :integer
  	add_column :calendar_items, :quantity, :integer
  	add_column :calendar_items, :price, :decimal
  end
end