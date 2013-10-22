class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :picture_url
      t.string :business_id
      t.decimal :price

      t.timestamps
    end
  end
end
