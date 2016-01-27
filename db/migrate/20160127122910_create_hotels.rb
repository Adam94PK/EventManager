class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.references :event, index: true
      t.string :name, index: true
      t.string :city, index: true
      t.string :address
      t.text :description
      t.string :link
      t.integer :standard
      t.string :phone
      t.string :email
      t.attachment :picture
      t.timestamps null: false
    end

      create_table :hotes_events do |t|
  	t.references :event, index: true
  	t.references :hotels, index: true
  end

  end
end
