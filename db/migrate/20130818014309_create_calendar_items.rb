class CreateCalendarItems < ActiveRecord::Migration
  def change
    create_table :calendar_items do |t|
      t.datetime :execution_date
      t.boolean  :done, default: false
      t.integer  :calendar_id
      
      t.timestamps
    end
    add_index :calendar_items, :calendar_id
  end
end
