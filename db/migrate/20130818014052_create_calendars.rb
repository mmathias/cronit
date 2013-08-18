class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.datetime :start_date
      t.string   :how_often
      t.string   :how_long
      t.integer  :user_id

      t.timestamps
    end
    add_index :calendars, :user_id
   
  end
end
