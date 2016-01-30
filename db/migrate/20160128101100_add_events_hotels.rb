class AddEventsHotels < ActiveRecord::Migration
  def change
  	create_table :events_hotels do |t|
  		t.references :event
  		t.references :hotel
  		t.timestamps null: false
  	end
  end
end
