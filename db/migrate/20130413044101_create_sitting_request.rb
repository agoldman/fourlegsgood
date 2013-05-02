class CreateSittingRequest < ActiveRecord::Migration
  def change
    create_table :sitting_requests do |t|

    	t.integer :owner_id
    	t.string :start_date
    	t.string :end_date
    	t.string :status, default: "requested"

      t.timestamps
    end
    add_index :sitting_requests, :owner_id
  end
end
