class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, index: true, :unique=>true
      t.string :email, index: true, :null=>false, :unique=>true
      t.string :role
      t.string :name
      t.string :surname
      t.string :company_name
      t.string :password_digest
      t.timestamps null: false
    end
  end

end
