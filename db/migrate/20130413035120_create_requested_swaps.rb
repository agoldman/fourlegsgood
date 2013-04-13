class CreateRequestedSwaps < ActiveRecord::Migration
  def change
    create_table :requested_swaps do |t|

    	t.integer :user_id
    	t.date :start_date
    	t.date :end_date
    	t.boolean :cash_option

      t.timestamps
    end
    add_index :requested_swaps, :user_id
  end
end
