class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
    	t.string :review
    	t.float :longitude , default: 0
    	t.float :latitude , :float , default: 0
    	t.references :user ,foreign_key: true, null: false
    	t.integer :ratings , null: false , default: 1

      t.timestamps null: false 
    end
  end
end
