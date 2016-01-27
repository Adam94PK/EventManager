class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.references :event, index: true
      t.text :content
      t.attachment :picture
      t.timestamps null: false
    end
  end
end
