class AddColumnsToUsers < ActiveRecord::Migration
  def self.up
  	change_table :users do |t|
    	t.string :user_name
    	t.string :surname
    	t.string :company_name
  	end
  end

  def self.down
	change_table :users do |t|
    	t.remove :user_name
    	t.remove :surname
    	t.remove :company_name
  	end
  end
end
