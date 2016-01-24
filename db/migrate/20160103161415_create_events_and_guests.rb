class CreateEventsAndGuests < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, default: 'New Event', index: true
      t.references :user, index: true, null: false
      t.timestamps null: false
    end

    create_table :guests do |t|
  	  t.string :email, null: false, index: true
  	  t.string :name
  	  t.string :surname
      t.timestamps null: false
    end

    create_table :events_guests do |t|
    	t.belongs_to :event, null: false, index: true
    	t.belongs_to :guest, null: false, index: true
    end
  end
  
end
