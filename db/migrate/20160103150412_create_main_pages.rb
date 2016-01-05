class CreateMainPages < ActiveRecord::Migration
  def change
    create_table :main_pages do |t|
  	  t.string :title, default: 'Main Page' ,index: true
  	  t.text :header
  	  t.text :content
      t.timestamps null: false
    end
  end
end
