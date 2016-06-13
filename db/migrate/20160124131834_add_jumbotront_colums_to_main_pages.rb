class AddJumbotrontColumsToMainPages < ActiveRecord::Migration
  def change
    add_attachment :main_pages, :jumbotron
  end
end
