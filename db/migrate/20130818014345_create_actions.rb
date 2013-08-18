class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string  :command
      t.integer :calendar_id
      t.timestamps
    end
    add_index :actions, :calendar_id
  end
end
