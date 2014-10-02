class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|

    	t.string :title
    	t.string :address

    	t.text :description

    	t.integer :price_in_pence
    	t.integer :no_of_rooms
    	t.integer :user_id

    	t.boolean :is_featured

      	t.timestamps
    end
  end
end
