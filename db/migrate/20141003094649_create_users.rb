class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :name
    	t.string :username
    	t.string :email
    	# add _digest to encrypt password - part of bcrypt gem
    	t.string :password_digest

      	t.timestamps
    end
  end
end
