class CreateEventsAndGuests < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, index: true
      t.integer :user_id
      t.integer :main_page_id
      t.timestamps null: false
    end

    create_table :guests do |t|
  	  t.string :email, index: true
  	  t.string :name
  	  t.string :surname
      t.timestamps null: false
    end

    create_table :events_guests do |t|
    	t.belongs_to :event, index: true
    	t.belongs_to :guest, index: true
    end
  end
  
end
