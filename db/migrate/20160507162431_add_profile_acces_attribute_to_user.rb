class AddProfileAccesAttributeToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_access, :boolean, default: false
  end
end
