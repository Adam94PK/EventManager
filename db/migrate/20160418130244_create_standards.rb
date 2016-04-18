class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :name
      t.integer :standard

      t.timestamps null: false
    end
  end
end
