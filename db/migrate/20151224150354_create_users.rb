class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false, index: true, unique: true
      t.string :role, default: 'user'
      t.string :name
      t.string :surname
      t.string :company_name
      t.timestamps null: false
    end
  end
end
