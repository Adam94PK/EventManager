class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "name", :limit=>30
      t.string "email", :limit=>100, :null=>false, :unique=>true
      t.string "role", :limit=>10
      t.string "password_digest"
      t.timestamps null: false
    end
    add_index("users", "email")
  end

  def down
  	drop_table :users
  end

end
