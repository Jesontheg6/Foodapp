class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :name 
    	t.string :birthday 
    	t.string :gender
    	t.string :country
    	t.string :email
    	t.string :password
    	t.string :password_digest
    	t.string :password_confirmation 

     t.timestamps
    end
  end
end
 