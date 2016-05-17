class AddParticipantsToEvent < ActiveRecord::Migration
  def up
    add_column :events, :participants, :integer, default: 0, index: true
  end
  def down
    remove_column :events, :participants
  end
end
