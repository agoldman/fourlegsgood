class CreateSwapExchanges < ActiveRecord::Migration
  def change
    create_table :requested_swap_exchanges do |t|

    	t.integer :requester_id
    	t.integer :posessor_id
    	t.string  :status
    	t.decimal :price
      t.timestamps
    end
    add_index :requested_swap_exchanges, :requester_id
    add_index :requested_swap_exchanges, :posessor_id
  end
end
