class AddIndexToMainPages < ActiveRecord::Migration
  def change
    change_table(:main_pages) do |t|
      t.references :event, index: true
    end
  end
end
