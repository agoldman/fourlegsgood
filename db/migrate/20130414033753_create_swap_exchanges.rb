class CreateSwapExchanges < ActiveRecord::Migration
  def change
    create_table :swap_exchanges do |t|

    	t.integer :swap_requester_id
    	t.integer :swap_posessor_id
    	t.string  :status
    	t.decimal :price
      t.timestamps
    end
    add_index :swap_exchanges, :swap_requester_id
    add_index :swap_exchanges, :swap_posessor_id
  end
end
