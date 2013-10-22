class AddingUserFields < ActiveRecord::Migration
  def change
  	add_column :users, :type, :string
  	add_column :users, :description, :string
  	add_column :users, :logo_url, :string
  end
end
