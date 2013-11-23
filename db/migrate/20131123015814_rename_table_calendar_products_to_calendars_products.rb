class RenameTableCalendarProductsToCalendarsProducts < ActiveRecord::Migration
  def change
	rename_table :calendar_products, :calendars_products
  end
end
