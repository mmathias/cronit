class ManyToManyCalendarProducts < ActiveRecord::Migration
  	def change
  		create_table :calendar_products do |t|
	    	t.integer :product_id
	      	t.integer :calendar_id
	      	t.integer :quantity

	      	t.timestamps
	    end

	    remove_column :calendar_items, :product_id, :integer
	  	remove_column :calendar_items, :quantity, :integer
  	end
end
