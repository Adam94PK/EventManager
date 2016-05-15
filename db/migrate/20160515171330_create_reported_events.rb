class CreateReportedEvents < ActiveRecord::Migration
  def change
    create_table :reported_events do |t|
      t.references :event
      t.references :user
      t.string :reason
      t.timestamps null: false
    end
  end
end
