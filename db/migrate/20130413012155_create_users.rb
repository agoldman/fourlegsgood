class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :name
    	t.string :password
    	t.string :remember_key
    	t.decimal :latitude
    	t.decimal :longitude 
    	t.string :email
    	t.decimal :rate, :default => nil
    	t.integer :dog_karma, :default => nil
    	t.integer :sitter_karma, :default => nil
    	t.integer :swaps_earned, :default => 0

      t.timestamps
    end
  end
end
