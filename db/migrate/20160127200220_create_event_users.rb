class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.string :role, default: 'admin'
      t.timestamps null: false
    end
    add_index :event_users, [:user_id, :event_id], unique: true
  end
end
