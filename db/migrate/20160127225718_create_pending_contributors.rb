class CreatePendingContributors < ActiveRecord::Migration
  def change
    create_table :pending_contributors do |t|
      t.references :event
      t.references :user
      t.string :role
      t.timestamps null: false
    end
  end
end
