class AddDefaultsToRooms < ActiveRecord::Migration
  def change
  	change_column :rooms, :is_featured, :boolean, default: false
  end
end
