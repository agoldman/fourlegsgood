class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :name
        t.string :email
    	t.string :password
    	t.string :remember_key
    	t.decimal :latitude
    	t.decimal :longitude 
    	t.decimal :sitter_rate, default: nil
    	t.integer :dog_karma, default: nil
    	t.integer :sitter_karma, default: nil
    	t.integer :swaps_earned, default: 1
    	t.integer :swap_price, default: nil

      t.timestamps
    end
  end
end
