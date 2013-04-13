class CreateScheduledSwaps < ActiveRecord::Migration
  def change
    create_table :scheduled_swaps do |t|

    	t.integer :sitter_id
    	t.integer :owner_id
    	t.integer :rate
    	t.date :start_date
    	t.date :end_date
    	t.string :status

      t.timestamps
    end
  end
end
