class CreateHotelPictures < ActiveRecord::Migration
  def change
    create_table :hotel_pictures do |t|
      t.references :hotel
      t.attachment :picture
      t.timestamps null: false
    end
  end
end
